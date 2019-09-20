# = The Tennis test

# Build a simple Ruby program implementing all of the rules mentioned below.

# The main game class should have the methods #point_won_by and #score. When starting the program, the user should select whether to a add a point to player A or B. Display the current score after each point and display when one of the players win.

# == Rules

# - There are exactly two players.
# - Each player can have one of the scores 0, 15, 30, 40. The successor of 0 is 15 and so forth for all scores up to 40.
# - If the scoring player has the score 40 and the other player has a smaller score, then the scoring player has won.
# - If both have 40 the players are 'deuce'.
# - If a player scores and the game is in a deuce state, the scoring player gets 'advantage'
# - If a player scores and has 'advantage' then the scoring player has won
# - If a player scores and his opponent has 'advantage' then the game is tied in a 'deuce' state.

# == Alternate description of the rules per Wikipedia:

# - A game is won by the first player to have won at least four points in total and at least two points more than the opponent.
# The running score of each game is described in a manner peculiar to tennis: scores from zero to three points are described as 'love', 'fifteen', 'thirty', and 'forty' respectively.
# - If at least three points have been scored by each player, and the scores are equal, the score is 'deuce'.
# - If at least three points have been scored by each side and a player has one more point than his opponent, the score of the game is 'advantage' for the player in the lead.

class Game
  attr_reader :player1, :player2, :points, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @points = {
      player1 => '0',
      player2 => '0'
    }
  end

  def point_won_by(won_player)
    return unless points.keys.include? won_player
    lose_player = won_player == player1 ? player2 : player1

    case points[won_player]
    when '0'
      points[won_player] = '15'
    when '15'
      points[won_player] = '30'
    when '30'
      points[won_player] = '40'
    when '40'
      if points[lose_player] == '40'
        points[won_player] = 'advantage'
      elsif points[lose_player] == 'advantage'
        points[player1] = '40'
        points[player2] = '40'
      else
        @winner = won_player
      end
    when 'advantage'
      if points[lose_player] == 'advantage'
        points[player1] = '40'
        points[player2] = '40'
      else
        @winner = won_player
      end
    end
  end

  def score
    "#{player1}:#{points[player1]}  #{player2}: #{points[player2]}  #{status}"
  end

  def status
    return 'deuce' if points[player1] == '40' && points[player2] == '40'
  end
end

# run
puts 'new game'
game = Game.new('A', 'B')

while game.winner.nil?
  puts game.score
  puts 'points wont by:'
  won_player = gets.chomp
  game.point_won_by(won_player)
end

puts "winner: #{game.winner}"

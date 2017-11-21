class Sudoku
  def self.done_or_not(board)
    (0..8).each do |i|
      return 'Try again!' if (board[i].include?(0)) || (board[i].detect{ |e| board[i].count(e) > 1 })
      cols = (0..8).map { |j| board[j][i] }
      return 'Try again!' if  cols.detect{ |e| cols.count(e) > 1 }
    end

    block = board[0][0..2] + board[1][0..2] + board[2][0..2]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[3][0..2] + board[4][0..2] + board[5][0..2]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[6][0..2] + board[7][0..2] + board[8][0..2]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }

    block = board[0][3..5] + board[1][3..5] + board[2][3..5]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[3][3..5] + board[4][3..5] + board[5][3..5]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[6][3..5] + board[7][3..5] + board[8][3..5]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }

    block = board[0][6..8] + board[1][6..8] + board[2][6..8]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[3][6..8] + board[4][6..8] + board[5][6..8]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }
    block = board[6][6..8] + board[7][6..8] + board[8][6..8]
    return 'Try again!' if block.detect{ |e| block.count(e) > 1 }

    'Finished!'
  end
end

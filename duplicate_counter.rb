class DuplicateCounter
  def self.duplicate_count(text)
    text.chars.map(&:downcase).uniq.select { |letter| text.downcase.count(letter) > 1 }.size
  end
end

class VowelCounter
  def self.getCount(inputStr)
    inputStr.downcase.chars.count { |c| 'aeiou'.include?(c) }
  end
end

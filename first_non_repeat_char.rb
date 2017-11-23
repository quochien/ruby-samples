class FirstNonRepeatChar
  def self.first_non_repeating_letter(s)
    return s if s.length <= 1
    t = s.downcase
    (0...(s.length-1)).each do |i|
      return s[i] unless (t[0...i] + t[(i+1)..-1]).include? t[i]
    end
    ''
  end
end

class SimpleEncryption
  def self.encrypt(text, n)
    return text if text.to_s.empty? || n <= 0
    n.times do
      text = text.scan(/.(.)/).flatten.join + text.scan(/(.).?/).flatten.join
    end
    text
  end

  def self.decrypt(encrypted_text, n)
    return encrypted_text if encrypted_text.to_s.empty? || n <= 0
    len = encrypted_text.length / 2
    n.times do
      encrypted_text = encrypted_text[len..-1].chars.zip(encrypted_text[0...len].chars).flatten.join
    end
    encrypted_text
  end
end

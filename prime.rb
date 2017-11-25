class Prime
  def self.isPrime(num)
    return num == 2 if num <= 2 || num % 2 == 0
    (3..Math.sqrt(num).to_i).each do |x|
      return false if num % x == 0
    end
    true
  end
end

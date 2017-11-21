class PerfectPower
  def self.isPP(n)
    return nil if n < 4

    sqrt_n = Math.sqrt(n)
    return [sqrt_n.to_i, 2] if sqrt_n % 1 == 0

    max_power = sqrt_n.ceil
    (2..max_power).each do |i|
      (2..max_power).each do |j|
        break if i**j > n
        return [i, j] if i**j == n
      end
    end

    nil
  end
end

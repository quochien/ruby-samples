class TwoToOne
  def self.longest(a1, a2)
    (a1+a2).chars.uniq.sort.join
  end
end

class ProductFib
  def self.product_fib(prod)
    fn = 0
    fn1 = 1
    loop do
      break if fn * fn1 >= prod
      f = fn + fn1
      fn = fn1
      fn1 = f
    end

    [fn, fn1, fn * fn1 == prod]
  end
end

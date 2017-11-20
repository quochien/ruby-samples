require 'spec_helper'

describe ProductFib do
  it 'returns true' do
    expect(ProductFib.product_fib(4895)).to eq [55, 89, true]
  end

  it 'returns false' do
    expect(ProductFib.product_fib(5895)).to eq [89, 144, false]
  end
end

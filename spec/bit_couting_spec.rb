require 'spec_helper'

describe BitCounting do
  it 'works properly' do
    expect(BitCounting.count_bits(0)).to eq 0
    expect(BitCounting.count_bits(4)).to eq 1
    expect(BitCounting.count_bits(7)).to eq 3
    expect(BitCounting.count_bits(9)).to eq 2
    expect(BitCounting.count_bits(10)).to eq 2
  end
end

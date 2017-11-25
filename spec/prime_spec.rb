require 'spec_helper'

describe Prime do
  let(:klass) { described_class }

  it "Should return false for numbers less than 2." do
    expect(klass.isPrime(-1)).to eq false
    expect(klass.isPrime(0)).to eq false
    expect(klass.isPrime(1)).to eq false
  end

  it "Should return false for non-prime numbers." do
    expect(klass.isPrime(4)).to eq false
    expect(klass.isPrime(100)).to eq false
    expect(klass.isPrime(999)).to eq false
    expect(klass.isPrime(958297)).to eq false
  end

  it "Should return true for prime numbers." do
    expect(klass.isPrime(2)).to eq true
    expect(klass.isPrime(3)).to eq true
    expect(klass.isPrime(5)).to eq true
    expect(klass.isPrime(457)).to eq true
    expect(klass.isPrime(39229)).to eq true
  end
end

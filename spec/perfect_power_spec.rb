require 'spec_helper'

describe PerfectPower do
  let(:klass) { described_class }

  it "should work for some small numbers" do
    expect(klass.isPP(4)).to eq [2,2]
    expect(klass.isPP(8)).to eq [2,3]
    expect(klass.isPP(36)).to eq [6,2]
    expect(klass.isPP(9)).to eq [3, 2]
    expect(klass.isPP(5)).to eq nil
  end

  it "should return valid pairs for random inputs" do
    i = 0
    while (i < 20) do
      a = rand(1000..65000)
      #puts a
      r = klass.isPP(a)
      if ((r != nil) && (r[0] ** r[1] != a)) then
        expect(r).to eq r
        break
      end
      i += 1
    end
  end
end

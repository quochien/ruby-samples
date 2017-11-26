require 'spec_helper'

describe VowelCounter do
  let(:klass) { described_class }

  it 'basic tests' do
    expect(klass.getCount("abracadabra")).to eq 5
    expect(klass.getCount("")).to eq 0
    expect(klass.getCount("pear tree")).to eq 4
    expect(klass.getCount("o a kak ushakov lil vo kashu kakao")).to eq 13
  end
end

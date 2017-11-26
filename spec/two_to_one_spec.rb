require 'spec_helper'

describe TwoToOne do
  let(:klass) { described_class }

  it 'basic tests' do
    expect(klass.longest("aretheyhere", "yestheyarehere")).to eq "aehrsty"
    expect(klass.longest("loopingisfunbutdangerous", "lessdangerousthancoding")).to eq "abcdefghilnoprstu"
    expect(klass.longest("inmanylanguages", "theresapairoffunctions")).to eq "acefghilmnoprstuy"
    expect(klass.longest("lordsofthefallen", "gamekult")).to eq "adefghklmnorstu"
    expect(klass.longest("codewars", "codewars")).to eq "acdeorsw"
    expect(klass.longest("agenerationmustconfrontthelooming", "codewarrs")).to eq "acdefghilmnorstuw"
  end
end

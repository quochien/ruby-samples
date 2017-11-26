require 'spec_helper'

describe DuplicateCounter do
  let(:klass) { described_class }

  it 'basic tests' do
    expect(klass.duplicate_count("")).to eq 0
    expect(klass.duplicate_count("abcde")).to eq 0
    expect(klass.duplicate_count("abcdeaa")).to eq 1
    expect(klass.duplicate_count("abcdeaB")).to eq 2
    expect(klass.duplicate_count("Indivisibilities")).to eq 2

    alphalow = Array('a'..'z').join("")
    alphaup = alphalow.upcase

    expect(klass.duplicate_count(alphalow)).to eq 0
    expect(klass.duplicate_count(alphalow + "aaAb")).to eq 2

    expect(klass.duplicate_count(alphalow+alphalow)).to eq 26
    expect(klass.duplicate_count(alphalow+alphaup)).to eq 26
  end
end

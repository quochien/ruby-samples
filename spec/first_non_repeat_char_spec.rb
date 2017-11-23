require 'spec_helper'

describe FirstNonRepeatChar do
  let(:klass) { described_class }

  it('should handle simple tests') do
    expect(klass.first_non_repeating_letter('a')).to eq 'a'
    expect(klass.first_non_repeating_letter('stress')).to eq 't'
    expect(klass.first_non_repeating_letter('moonmen')).to eq 'e'
  end

  it('should handle empty strings') do
    expect(klass.first_non_repeating_letter('')).to eq ''
  end

  it('should handle all repeating strings') do
    expect(klass.first_non_repeating_letter('abba')).to eq ''
    expect(klass.first_non_repeating_letter('aa')).to eq ''
  end

  it('should handle odd characters') do
    expect(klass.first_non_repeating_letter('hello world, eh?')).to eq 'w'
    expect(klass.first_non_repeating_letter('~A string with some special char~')).to eq 'n'
  end

  it('should handle letter cases') do
    expect(klass.first_non_repeating_letter('sTreSS')).to eq 'T'
    expect(klass.first_non_repeating_letter('Go hang a salami, I\'m a lasagna hog!')).to eq ','
  end
end

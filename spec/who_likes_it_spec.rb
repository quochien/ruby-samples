require 'spec_helper'

describe WhoLikesIt do
  let(:klass) { described_class }

  it 'basic tests' do
    expect(klass.likes([])).to eq 'no one likes this'
    expect(klass.likes(['Peter'])).to eq 'Peter likes this'
    expect(klass.likes(['Jacob', 'Alex'])).to eq 'Jacob and Alex like this'
    expect(klass.likes(['Max', 'John', 'Mark'])).to eq 'Max, John and Mark like this'
    expect(klass.likes(['Alex', 'Jacob', 'Mark', 'Max'])).to eq 'Alex, Jacob and 2 others like this'
  end

  it 'random tests' do
    def randint(a, b)
      rand(b - a + 1) + a
    end

    def sol(names)
      names.length == 0 ?
        'no one likes this' : names.length == 1 ?
          "#{names[0]} likes this" : names.length == 2 ?
            "#{names[0]} and #{names[1]} like this" : names.length < 4 ?
              names.slice(0, names.length-2).join(", ") + ", " + klass.likes(names.slice(names.length-2, names.length)) :
                "#{names[0]}, #{names[1]} and #{names.length-2} others like this"
    end

    base = ["Sylia Stingray", "Priscilla S. Asagiri", "Linna Yamazaki", "Nene Romanova", "Nigel", "Macky Stingray", "Largo", "Brian J. Mason", "Sylvie", "Anri", "Leon McNichol", "Daley Wong", "Galatea", "Quincy Rosenkreutz"]

    40.times do
      base = base.shuffle
      names = base.slice(0, randint(0,base.length-1))
      expect(klass.likes(names)).to eq sol(names)
    end
  end
end

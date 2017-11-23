require 'spec_helper'

describe SimpleEncryption do
  let(:klass) { described_class }

  describe 'basic tests' do
    it 'Testing encrypt' do
      expect(klass.encrypt("This is a test!", 0)).to eq "This is a test!"
      expect(klass.encrypt("This is a test!", 1)).to eq "hsi  etTi sats!"
      expect(klass.encrypt("This is a test!", 2)).to eq "s eT ashi tist!"
      expect(klass.encrypt("This is a test!", 3)).to eq " Tah itse sits!"
      expect(klass.encrypt("This is a test!", 4)).to eq "This is a test!"
      expect(klass.encrypt("This is a test!", -1)).to eq "This is a test!"
      expect(klass.encrypt("This kata is very interesting!", 1)).to eq "hskt svr neetn!Ti aai eyitrsig"
    end

    it 'Testing decrypt' do
      expect(klass.decrypt("This is a test!", 0)).to eq "This is a test!"
      expect(klass.decrypt("hsi  etTi sats!", 1)).to eq "This is a test!"
      expect(klass.decrypt("s eT ashi tist!", 2)).to eq "This is a test!"
      expect(klass.decrypt(" Tah itse sits!", 3)).to eq "This is a test!"
      expect(klass.decrypt("This is a test!", 4)).to eq "This is a test!"
      expect(klass.decrypt("This is a test!", -1)).to eq "This is a test!"
      expect(klass.decrypt("hskt svr neetn!Ti aai eyitrsig", 1)).to eq "This kata is very interesting!"
      expect(klass.encrypt("", 0)).to eq ""
      expect(klass.decrypt("", 0)).to eq ""
    end
  end

  # describe 'Random Tests' do
  #   def randint(a,b) rand(b-a+1)+a end
  #   def esol(t, n) n<=0 ? t : encrypt(((1..t.length).step(2).map{|i| t[i]}+(0..t.length).step(2).map{|i| t[i]}).join, n-1) end
  #   base="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.;:!?"

  #   40.times do
  #     t,n=(0..randint(1,8)).map{(0..randint(3,13)).map{base[randint(0,base.length-1)]}.join}.join(" "),randint(-2,12)

  #     expected=esol(t,n)

  #     it "Testing encrypt for #{t.inspect} and #{n}" do
  #       expect(klass.encrypt(t+"",n)).to eq expected
  #     end

  #     it "Testing decrypt for #{expected} and #{n}" do
  #       expect(klass.decrypt(expected+"",n)).to eq t
  #     end
  #   end
  # end
end

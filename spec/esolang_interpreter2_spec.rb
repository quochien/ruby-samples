require 'spec_helper'

describe EsolangInterpreter2 do
  let(:klass) { described_class }

  it "should work for some example test cases" do
    # Flips the leftmost cell of the tape
    expect(klass.interpreter("*", "00101100")).to eq "10101100"
    # Flips the second and third cell of the tape
    expect(klass.interpreter(">*>*", "00101100")).to eq "01001100"
    # Flips all the bits in the tape
    expect(klass.interpreter("*>*>*>*>*>*>*>*", "00101100")).to eq "11010011"
    # Flips all the bits that are initialized to 0
    expect(klass.interpreter("*>*>>*>>>*>*", "00101100")).to eq "11111111"
    # Goes somewhere to the right of the tape and then flips all bits that are initialized to 1, progressing leftwards through the tape
    expect(klass.interpreter(">>>>>*<*<<*", "00101100")).to eq "00000000"
  end

  it "should ignore all non-command characters" do
    expect(klass.interpreter("iwmlis *!BOSS 333 ^v$#@", "00101100")).to eq "10101100"
    expect(klass.interpreter(">*>*;;;.!.,+-++--!!-!!!-", "00101100")).to eq "01001100"
    expect(klass.interpreter("    *  >\n    *           >\n    \n*>*lskdfjsdklfj>*;;+--+--+++--+-+-  lskjfiom,x  \n>*sdfsdf>sdfsfsdfsdfwervbnbvn*,.,.,,.,.  >\n\n\n*", "00101100")).to eq "11010011"
    expect(klass.interpreter("*,,...,..,..++-->++++-*>--+>*>+++->>..,+-,*>*", "00101100")).to eq "11111111"
    expect(klass.interpreter(">>nssewww>>wwess>*<nnn*<<ee*", "00101100")).to eq "00000000"
  end

  it "should return the final state of the tape immediately if the pointer ever goes out of bounds" do
    expect(klass.interpreter("*>>>*>*>>*>>>>>>>*>*>*>*>>>**>>**", "0000000000000000")).to eq "1001101000000111"
    expect(klass.interpreter("<<<*>*>*>*>*>>>*>>>>>*>*", "0000000000000000")).to eq, "0000000000000000"
    expect(klass.interpreter("*>*>*>>>*>>>>>*<<<<<<<<<<<<<<<<<<<<<*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*>*>*", "11111111111111111111111111111111")).to eq "00011011110111111111111111111111"
    expect(klass.interpreter(">>*>*>*<<*<*<<*>*", "1101")).to eq "1110"
  end

  it "should work for some simple and nested loops" do
    expect(klass.interpreter("*[>*]", "0" * 256)).to eq "1" * 256
    expect(klass.interpreter("[>*]", "0" * 256)).to eq "0" * 256
    expect(klass.interpreter("*>*>>>*>*>>>>>*>[>*]", "0" * 256)).to eq "11001100001" + "0" * 245
    expect(klass.interpreter("*>*>>>*>*>>>>>*[>*]", "0" * 256)).to eq "11001100001" + "1" * 245
    expect(klass.interpreter("*[>[*]]", "0" * 256)).to eq "1" + "0" * 255
    expect(klass.interpreter("*[>[*]]", "1" * 256)).to eq "0" + "1" * 255
    expect(klass.interpreter('[[]*>*>*>]', '000')).to eq '000'
    expect(klass.interpreter('*>[[]*>]<*', '100')).to eq '100'
    expect(klass.interpreter('[*>[>*>]>]', '11001')).to eq '01100'
    expect(klass.interpreter('[>[*>*>*>]>]', '10110')).to eq '10101'
  end

  # it "should work for randomly-generated programs" do
  #   for i in 0..99
  #     code = ">" * 500 + random_program()
  #     tape = random_tape()
  #     expected = ggmoy_solution(code, tape)
  #     actual = klass.interpreter(code, tape)
  #     expect(actual).to eq expected
  #   end
  # end
end

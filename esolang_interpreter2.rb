class EsolangInterpreter2
  def self.interpreter(code, tape)
    i = 0
    j = 0
    k = 0

    code.chars.each do |c|
      exit if i < 0 || i >= tape.length
      case c
      when '>'
        i += 1
      when '<'
        i -= 1
      when '*'
        tape[i] = tape[i] == '0' ? '1' : '0'
      when '['
        j = i
        i = k if tape[i] == '0'
      when ']'
        k = i
        i = j if tape[i] == '1'
      end
    end

    tape
  end
end

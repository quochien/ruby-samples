s = "ank anku ankus ankush ankusha"
s.split(' ').reject{ |word| word[1..-1].include? word[0] }.max_by(&:length)

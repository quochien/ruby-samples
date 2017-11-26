class WhoLikesIt
  def self.likes(names)
    return 'no one likes this' if names.empty?
    return "#{names[0]} likes this" if names.length == 1
    return "#{names[0...-1].join(', ')} and #{names[-1]} like this" if names.length <= 3
    return "#{names[0..1].join(', ')} and #{names.length - 2} others like this"
  end
end

def substrings(string, strings)
  hash = Hash.new(0)
  strings.each do |str|
    if(string.include?(str))
      hash[str] += 1
    end
  end
  return hash
end
def ceasar_cipher(string, shift)
  result = ""
  string.split("").each do |letter|
    if letter.match(/[A-Z]/)
      letter = ((((letter.ord - 65) + shift) % 26) + 65).chr
    elsif letter.match(/[a-z]/)
      letter = ((((letter.ord - 97) + shift) % 26) + 97).chr
    end
    result << letter
  end
  result
end

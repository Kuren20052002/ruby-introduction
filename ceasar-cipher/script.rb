def ceasar_cipher(string, shift)
  result = ""
  string.each_byte do |char_num|
    if char_num > 64 && char_num < 91
      char_num += shift
      result << if char_num > 90
                  (64 + (char_num - 90)).chr
                else
                  char_num.chr
                end
    elsif char_num > 96 && char_num < 123
      char_num += shift
      result << if char_num > 122
                  (96 + (char_num - 122)).chr
                else
                  char_num.chr
                end
    else
      result << char_num.chr
    end
  end
  result
end

def swapcase(string)
  result = string.chars.map do |char|
    case
    when char.count('a-z') > 0 then char.upcase
    when char.count('A-Z') > 0 then char.downcase
    else char
    end
  end
  result.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

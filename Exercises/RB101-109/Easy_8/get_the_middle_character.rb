def center_of(string)
  mid = string.size / 2.0
  mid % 1 == 0 ? string[mid-1..mid] : string[mid.ceil-1]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

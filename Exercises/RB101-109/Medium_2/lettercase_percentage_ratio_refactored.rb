def letter_percentages(string)
  result = { lowercase: string.count('a-z'),
             uppercase: string.count('A-Z'),
             neither: string.count('^a-zA-Z') }
  result.map { |k, v| [k, ((v / result.values.sum.to_f) * 100).round(1)] }.to_h
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }

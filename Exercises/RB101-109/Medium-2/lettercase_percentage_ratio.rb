def letter_percentages(string)
  result = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }

  string.chars.each do |c|
    if c.count('a-z') > 0
      result[:lowercase] += 1
    elsif c.count('A-Z') > 0
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result.map { |k, v| [k, ((v / result.values.sum) * 100).round(1)] }.to_h
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }

def uppercase?(string)
  string.delete('^a-zA-Z').each_char { |c| return false if c.count('A-Z') == 0 }
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

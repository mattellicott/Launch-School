# Questions:
# Rules:
# New centuries begin at 01 and end at 100
# Centuries ending in 1, 2, or 3 have a corresponding suffix of st, nd, and rd
#   unless the century ends in 11, 12, or 13
#
# Input: integer
# Output: string
# Algorithm:
# -assign result to (input / 100.0).ceil
# -return result.to_s + 'th' if last 2 digits of result are [11, 12, 13]
#
# -find the last digit of result
#   -return result.to_s + 'st' when last digit is 1
#   -return result.to_s + 'st' when last digit is 2
#   -return result.to_s + 'st' when last digit is 3
#   -return result.to_s + 'st' when last digit is something else
#
def century(year)
  result = (year / 100.0).ceil
  return ("#{result}th") if [11, 12, 13].include?(result % 100)

  result.to_s + case result % 10
                when 1 then 'st'
                when 2 then 'nd'
                when 3 then 'rd'
                else 'th'
                end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

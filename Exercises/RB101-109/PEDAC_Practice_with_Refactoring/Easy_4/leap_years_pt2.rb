# Questions:
# Rules:
# Years 1752 and later use previous method
# Years prior to 1752 are leap years if evenly divisible by 4
#
# Input: integer
# Output: boolean
# Algorithm:
# -return previous method if year is >= 1752
# -return true if year % 4 == 0
#
def leap_year?(year)
  if year >= 1752
    year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

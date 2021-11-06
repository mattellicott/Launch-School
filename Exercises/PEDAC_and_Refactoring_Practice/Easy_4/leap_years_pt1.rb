# Questions:
# Rules:
# Leap years occur in years evenly divisible by 4
#   unless year is evenly divisible by 100
#     it is still a leap year if year is evenly divisible by 400
# Input will always be a whole number greater than 0
#
# Input: integer
# Output: boolean
# Algorithm:
# -return true if input is evenly divisible by 400
# -return false if input is evenly divisible by 100
# -return true if input is evenly divisible by 4
#
def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

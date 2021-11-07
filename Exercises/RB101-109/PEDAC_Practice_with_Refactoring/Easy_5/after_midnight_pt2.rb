# Questions:
# Requirements:
#   -input will be in the form if a 24 hour format, '00:00'
#   -'00:00' and '24:00' should both return 0
# Input: string
# Output: integer
# Algorithm:
#   -assign constant to MINUTES_PER_HOUR
#   -accept 1 string as argument
#   -return 0 if input is '00:00' or '24:00'
#   -define helper method, get_minutes(string)
#     -assign result to string split using ':' as delimeter
#     -find sum of (minutes[0].to_i * MINUTES_PER_HOUR) and minutes[1].to_i
#   -call get_minutes(string)
MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
def get_minutes(string)
  result = string.split(':')
  (result[0].to_i * MINUTES_PER_HOUR) + result[1].to_i
end

def after_midnight(string)
  return 0 if string == '00:00' || string == '24:00'
  get_minutes(string)
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

# Questions:
# Requirements:
#   -input will be in the form if a 24 hour format, '00:00'
#   -'00:00' and '24:00' should both return 0
# Input: string
# Output: integer
# Algorithm:
#   -assign constants to MINUTES_PER_DAY and MINUTES_PER_HOUR
#   -accept 1 string as argument
#   -return 0 if input is '00:00' or '24:00'
#   -find difference between MINUTES_PER_DAY and return of get_minutes(string)
def before_midnight(string)
  return 0 if string == '00:00' || string == '24:00'
  MINUTES_PER_DAY - get_minutes(string)
end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0

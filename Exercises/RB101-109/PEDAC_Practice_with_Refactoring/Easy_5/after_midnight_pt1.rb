# Questions:
# Rules:
# Explicit:
#   -May not use Date or Time classes
#   -Positive numbers reflect after midnight
#   -Negative numbers reflect before midnight
# Implicit:
# Input: integer
# Output: string
# Algorithm:
#   -assign constant, MINUTES_PER_DAY, to 1440
#   -assign constant, MINUTES_PER_HOUR, to 60
#   -accept 1 integer as argument
#   -assign time to
#     -divmod of (argument % MINUTES_PER_DAY) and MINUTES_PER_HOUR
#   -use format, "00:00" with quotient on the left and modulus on the right
MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
def time_of_day(n)
  time = (n % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  format("%0.2d:%0.2d", time[0], time[1])
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

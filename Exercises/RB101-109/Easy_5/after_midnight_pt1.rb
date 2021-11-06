MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60

# Further Exploration Problem 1
# def time_of_day(int)
#   time = int % MINUTES_PER_DAY
#   minutes = (time % MINUTES_PER_HOUR)
#   hours = ((time - minutes) / MINUTES_PER_HOUR)
#   format("%02d:%02d", hours, minutes)
# end

# Further Exploration Problem 2
# def time_of_day(int)
#   time = int. * SECONDS_PER_MINUTE
#   Time.at(time).utc.strftime("%H:%M")
# end

# Further Exploration Problem 3
def time_of_day(int)
  time = int * SECONDS_PER_MINUTE
  (Time.new(1970,1,4)+time).strftime("%A %H:%M")
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"

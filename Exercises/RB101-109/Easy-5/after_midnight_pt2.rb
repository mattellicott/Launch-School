MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

# def before_midnight(string)
#   offset = get_offset(string)
#   offset == 1440 || offset == 0 ? 0 : MINUTES_PER_DAY - offset
# end
#
# def after_midnight(string)
#   offset = get_offset(string)
#   offset % MINUTES_PER_DAY
# end
#
# def get_offset(string)
#   hours, minutes = string.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR) + minutes
# end

# Further Exploration
require 'time'
def before_midnight(string)
  offset = (Time.parse(string).hour * MINUTES_PER_HOUR) + Time.parse(string).min
  offset == 1440 || offset == 0 ? 0 : MINUTES_PER_DAY - offset
end

def after_midnight(string)
  (Time.parse(string).hour * MINUTES_PER_HOUR) + Time.parse(string).min
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

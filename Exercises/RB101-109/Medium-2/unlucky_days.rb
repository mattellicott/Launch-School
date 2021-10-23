def friday_13th(int)
  tally = 0
  date = Time.new(int)
  while date.year == int
  tally += 1 if date.day == 13 && date.friday?
  date += 86400
  end
  tally
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

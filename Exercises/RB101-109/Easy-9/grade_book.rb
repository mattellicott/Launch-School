def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3.0
  case
  when average >= 90 then 'A'
  when average >= 80 then 'B'
  when average >= 70 then 'C'
  when average >= 60 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

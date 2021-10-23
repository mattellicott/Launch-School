def triangle(a, b, c)
  angles = [a, b, c].sort
  return :invalid if angles[0] == 0 || angles.sum != 180
  return :right   if angles.any? { |i| i == 90 }
  return :acute   if angles.all? { |i| i < 90 }
  :obtuse
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

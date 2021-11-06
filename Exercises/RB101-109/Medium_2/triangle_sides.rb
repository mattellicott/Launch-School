def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid     if sides[0..1].sum <= sides[2]
  return :equilateral if a == b && a == c
  return :isosceles   if a == b || a == c || b == c
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

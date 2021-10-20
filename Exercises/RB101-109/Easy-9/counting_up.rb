def sequence(int)
  result = []
  1.upto(int) { |i| result << i } if int.positive?
  -1.downto(int) { |i| result << i } if int.negative?
  result
end

# def sequence(int)
#   result = []
#   1.upto(int) { |i| result << i } if int.positive?
#   int.upto(1) { |i| result << i } if int.negative?
#   result
# end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [-1, -2, -3, -4, -5]
p sequence(-3) == [-1, -2, -3]
p sequence(-1) == [-1]
p sequence(0) == []
p sequence(-5) == [-5, -4, -3, -2, -1, 0, 1]

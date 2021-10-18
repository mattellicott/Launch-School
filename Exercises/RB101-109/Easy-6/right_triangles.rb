def triangle(int)
# Bottom Right Corner
  1.upto(int) do |i|
    puts format("%#{int}s", "*" * i)
  end
# Top Right Corner
  int.downto(1) do |i|
    puts format("%#{int}s", "*" * i)
  end
# Bottom Left Corner
  1.upto(int) do |i|
    puts '*' * i
  end
# Top Left Corner
  int.downto(1) do |i|
    puts '*' * i
  end
end

triangle(5)
# triangle(9)

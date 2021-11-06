def diamond(int)
  1.upto(int) do |i|
    puts '*'.center(int) if i == 1
    puts "#{(' ' * ((int - i) / 2))}*#{' ' * (i - 1)}*" if i.even?
  end
  (int - 2).downto(1) do |i|
    puts '*'.center(int) if i == 1
    puts "#{(' ' * ((int - i) / 2))}*#{' ' * (i - 1)}*" if i.even?
  end
end

diamond(77)

#   *
#  ***
# *   *
#  ***
#   *

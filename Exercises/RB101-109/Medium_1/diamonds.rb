def diamond(int)
  1.upto(int) { |i| puts "#{('*' * i).center(int)}" if i.odd?}
  (int - 2).downto(1) { |i| puts "#{('*' * i).center(int)}" if i.odd?}
end

diamond(5)

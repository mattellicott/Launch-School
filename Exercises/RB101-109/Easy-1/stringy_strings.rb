def stringy(int, num = 1)
  num = num.to_s
  while (int - 1).positive?
    num << (num.end_with?('1') ? '0' : '1')
    int -= 1
  end
  num
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7) == '1010101'

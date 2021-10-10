def xor?(bool1, bool2)
  x = 0
  x += 1 if bool1 == true
  x += 1 if bool2 == true
  x == 1
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

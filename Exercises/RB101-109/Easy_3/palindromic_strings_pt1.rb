def palindrome?(*arg)
  arg = arg.join(' ').to_s
  arg == arg.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?(%w[was it a car or a cat i saw]) == false
puts palindrome?(%w[Was it a car or a cat I saw]) == false
puts palindrome?('was it a car or a cat i saw') == false

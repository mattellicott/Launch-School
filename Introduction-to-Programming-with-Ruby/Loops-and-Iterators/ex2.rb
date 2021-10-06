x = ""
count = 0
while x != "STOP"
  count += 1
  puts "Loop #{count}: Enter STOP to stop."
  x = gets.chomp
end

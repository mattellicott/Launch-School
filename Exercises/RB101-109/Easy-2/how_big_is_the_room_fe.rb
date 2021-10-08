FOOT_TO_INCH = 12
FOOT_TO_CENTIMETER = 30.48

puts "Enter the length of the room in feet:"
length = gets.to_f
puts "Enter the width of the room in feet:"
width = gets.to_f

area_f = (length * width).round(2)
area_i = (area_f * FOOT_TO_INCH).round(2)
area_c = (area_f * FOOT_TO_CENTIMETER).round(2)
puts "The area of the room is #{area_f} square feet, #{area_i} square inches, and #{area_c} square centimeters."

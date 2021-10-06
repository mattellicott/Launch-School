array = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear" ]

array.each do |string|
  if string =~ /lab/
    puts "lab does exist in #{string}"
  else
    puts "lab does NOT exist in #{string}"
  end
end

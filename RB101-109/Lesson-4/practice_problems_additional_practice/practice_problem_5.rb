flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = nil
flintstones.each_with_index { |name, i| index = i if name.start_with?('Be') }
p index

p flintstones.index { |name| name.start_with?('Be') }

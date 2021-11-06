flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |element, idx|
  flintstones_hash[element] = idx
end

p flintstones_hash

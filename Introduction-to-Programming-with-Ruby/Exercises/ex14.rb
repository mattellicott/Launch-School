a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']
a2 = []

a.map! { |element| element.split(' ') }
a2 = a.flatten

puts a2

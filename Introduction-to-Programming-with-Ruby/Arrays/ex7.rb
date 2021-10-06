names = ['bob', 'joe', 'susan', 'margaret']
names.each_with_index { |value, index| puts index.to_s + ". " + value }

class Array
  def contains_all?(other_array)
    other_array.all? { |v| include?(v) }
  end
end

items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

puts items.contains_all?([1,2,3,4,5])
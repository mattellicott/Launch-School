# def buy_fruit(list)
#   new_list = []
#   list.each do |element|
#     element[1].times { |i| new_list << element[0] }
#   end
#   new_list
# end

def buy_fruit(list)
  list.map { |fruit, count| [fruit] * count }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

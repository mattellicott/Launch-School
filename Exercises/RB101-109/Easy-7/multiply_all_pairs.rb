def multiply_all_pairs(arr1, arr2)
  product = []
  arr1.each do |num1|
    arr2.each do |num2|
      product << num1 * num2
    end
  end
  product.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

def select_fruit(hash)
  new_hash = {}
  hash_keys = hash.keys
  counter = 0

  loop do
    break if counter == hash_keys.size

    current_key = hash_keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      new_hash[current_key] = current_value
    end

    counter += 1
  end

  new_hash
end

# def select_fruit(hash)
#   new_hash = {}
#   hash.each { |key, value| new_hash[key] = value if value == 'Fruit' }
#   new_hash
# end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

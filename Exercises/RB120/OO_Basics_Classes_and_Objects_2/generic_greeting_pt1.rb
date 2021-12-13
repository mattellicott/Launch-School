class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further Exploration
kitty = Cat.new
kitty.class.generic_greeting
# `generic_greeting` is called on the return of `kitty.class`, which is `Cat`
# In other words, it's the same as the line `Cat.generic_greeting`

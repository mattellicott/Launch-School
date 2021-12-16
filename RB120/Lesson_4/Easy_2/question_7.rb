class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# `@@cats_count` is a class variable.
# It keeps track of how many `Cat` objects have been instantiated.
# To check, you write `Cat.cats_count` or `Cat::cats_count`.

# FURTHER EXPLORATION
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# 42
# My name is 42.
# 42
# 43

# The `to_s` on line 5 doesn't mutate the object it is called on, so when
# `name` is incremented on line 27, the Integer object `42` is what is actually
# being incremented.

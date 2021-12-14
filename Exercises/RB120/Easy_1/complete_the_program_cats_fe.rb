# FURTHER EXPLORATION
class Pet
  def initialize(name, age, colors)
    @name = name
    @age = age
    @colors = colors
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# If the `Pet` class accepted all of the parameters necessary for lines 20-21,
# then the `initialize` method doesn't need to be defined in the `Cat` class.
# This is because the method path lookup would automatically call the `initialize`
# method in the `Pet` class when it doesn't find the method in the `Cat` class.

# It might not be a good idea to modify `Pet` this way in the event that other
# classes are already inheriting `Pet` as a superclass. If that was the case,
# then all of the subclasses would need to be examined.

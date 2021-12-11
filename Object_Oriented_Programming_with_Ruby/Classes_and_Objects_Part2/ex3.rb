class Person
  attr_writer :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# The error was raised because 'attr_reader' only gives a 'getter' method.
# On line 9, 'bob.name =' is calling a 'setter' method, so line 1 needs to be
# changed to 'attr_writer :name' or 'attr_accessor :name'(if we want both the 'getter' and 'setter' methods).

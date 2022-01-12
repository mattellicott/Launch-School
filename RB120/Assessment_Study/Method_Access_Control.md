Method Access Control is implemented through the use of the `public`, `private`, and `protected` access modifiers.<br>
Public methods are accessible throughout the program.<br>
Private methods are accessible within the class.<br>
Protected methods, from within the class are accessible like public methods, while from outside the class they are accessible like private methods.<br>

In this example, access to the `name` instance variable is restricted to instance methods of the calling object.
```ruby
class Animal
  def initialize(name)
    @name = name
  end

  def display_name
    puts name
  end

  private

  attr_reader :name
end

dog = Animal.new("Pepper")
dog.display_name # Outputs => Pepper
dog.name # NoMethodError
```

In this example, access to the `species` instance variable is restricted to instance methods defined in the `Animal` class.
```ruby
class Animal
  include Comparable

  def initialize(species)
    @species = species
  end

  def ==(other)
    self.species == other.species
  end
  
  protected

  attr_reader :species
end

dog = Animal.new("Dog")
cat = Animal.new("Cat")

puts dog == cat # Outputs => false
```
Instance variables can be referenced and set by prepending the variable name with a `@`. The use of `setters` and `getters` makes the code more readable and can also allow access to the instance variables of an object from outside the class definition.

Setting a instance variable:
```ruby
class Animal
  def name=(name)
    @name = name
  end
end
dog = Animal.new
dog.name = "Pepper"
```

Referencing a instance variable:
```ruby
class Animal
  def name
    @name
  end
end
dog = Animal.new
dog.name # => nil
```

Using a setter:
```ruby
class Animal
  attr_writer :name
end
dog = Animal.new
dog.name = "Pepper"
```

Using a getter:
```ruby
class Animal
  attr_reader :name
end
dog = Animal.new
dog.name # => nil
```

To create both setter and getter methods for a variable:
```ruby
class Animal
  attr_accessor :variable_name
end
dog = Animal.new
dog.name = "Pepper"
dog.name # Outputs => Pepper
```
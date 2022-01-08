`attr_*` can be used as a shortcut to create `setters` and `getters`. `attr_accessor` provides the functionality of both a `setter` and `getter`.<br>

`attr_reader :name` is a shortcut for creating a `name` instance method that returns the value referenced by the `name` instance variable.

```ruby
class Animal
  attr_reader :name

  def name
    @name
  end
end

Animal.new.name
```

`attr_writer :name` is a shortcut for creating a `name=` instance method that assigns the value passed in to the `name` instance variable.
```ruby
class Animal
  attr_writer :name

  def name=(name)
    @name = name
  end
end

Animal.new.name = "Bob"
```
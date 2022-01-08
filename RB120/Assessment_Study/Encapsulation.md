Encapsulation allows us to hide functionality of an object and only expose methods and properties that users need. In Ruby, this is done using method access control.<br>

The `setter` method for `name` is Private and the only **access** the user has to change the object is via the `change_name` instance method.
```ruby
class Dog
  def change_name(name)
    @name = name
  end

  private

  attr_writer :name
end

bob = Dog.new
bob.change_name("Bob")
```
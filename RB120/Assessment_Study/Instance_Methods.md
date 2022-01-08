Instance methods are defined in a class and available to objects(or instances) of that class.<br>

In this example, `speak` is a instance method that can be called by a object of the `Animal` class.
```ruby
class Animal
  def speak
  end
end

dog = Animal.new
dog.speak
```
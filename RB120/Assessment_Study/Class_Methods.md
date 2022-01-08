Class methods are methods that can be called directly on the class, without having to instantiate any objects. To define a class method, the method name is prepended with `self.`.
```ruby
class Animal
  def self.speak
    puts "Hello"
  end
end

Animal.speak # Outputs => Hello
```
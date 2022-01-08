Polymorphism is the ability of objects of different types to respond to messages in the same way.<br>

Both the `Dog` and `Cat` classes have access to the `move` instance method through class inheritance.
```ruby
class Animal
  def move
  end
end

class Dog < Animal; end
class Cat < Animal; end
```

Duck typing occurs when objects of different unrelated types both respond to the same method name. With duck typing, we aren't concerned with the class or type of an object, but we do care whether an object has a particular behavior.

The `Chef` and `Manager` classes both have the `do_job` instance method which allows them to both respond to the same method call.
```ruby
class Restaurant
  attr_reader :employees

  def work(employees)
    employees.each do |employee|
      employee.do_job
    end
  end
end

class Chef
  def do_job
    prepare_food
  end

  def prepare_food
  end
end

class Manager
  def do_job
    manage
  end

  def manage
  end
end
```

Both the `Dog` and `Cat` classes have access to the `move` instance method through interface inheritance.
```ruby
module Movable
  def move
  end
end

class Dog
  include Movable
end

class Cat
  include Movable
end
```

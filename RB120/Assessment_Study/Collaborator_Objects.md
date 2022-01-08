Collaborator objects are objects stored as state within another object.<br>

The `pet` instance variable is assigned to `bud`, which is an object instantiated to the `Bulldog` class. This makes `bud` a collaborator object since it is stored as part of the state of the `bob` object.
```ruby
class Person
  attr_accessor :pet
end
class Bulldog; end

bob = Person.new
bud = Bulldog.new

bob.pet = bud
```
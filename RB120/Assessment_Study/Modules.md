Modules are the way that Ruby enables a form of multiple inheritance. We can mix-in behaviors to a class via modules.<br>

In this example, `SomeClass` inherits the behaviors from `SomeModule`.
```ruby
module SomeModule
end

class SomeClass
  include SomeModule
end
```
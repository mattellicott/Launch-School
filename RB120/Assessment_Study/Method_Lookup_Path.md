Method Lookup Path<br>

The path that Ruby takes to look for a method. This can be visualized by
calling the `ancestors` class method.
```ruby
Class_name.ancestors
```

The order this path follows is:<br>
Class(or instance of the class) the method is called on<br>
Modules(in the reverse order that they were included in the Class)<br>
Inherited Class<br>
rinse and repeat...<br>

Ruby stops looking when it finds a method matching the method that was called.<br>
If Ruby doesn't find a method in the lookup path, it will raise an error.
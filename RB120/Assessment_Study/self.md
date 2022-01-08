There are 2 main ways to use `self`.<br>

When calling `self` from within a instance method, it references the calling object.<br>

We can also prepend `self.` when defining a method in a class. This defines a class method. This is because calling `self` outside of an instance method references the class itself.
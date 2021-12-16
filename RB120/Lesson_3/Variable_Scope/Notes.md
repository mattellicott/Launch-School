**Instance Variable Scope**

Instance variables are variables that start with `@` and are **scoped at the object level**. They are used to track individual object state, and do not cross over between objects.<br>
Referencing an uninitialized instance variable returns `nil`.

<br><br>
**Class Variable Scope**

Class variables start with `@@` and are **scoped at the class level**.

-all objects share 1 copy of the class variable. (This also implies objects can access class variables by way of instance methods.)<br>
-class methods can access class variables, regardless of where it's initialized.

<br><br>
**Constant Variable Scope**

Constants can be accessed in class methods or instance methods.<br>
Ruby will throw a warning(not an error) if you try to re-assign.<br>
They begin with **capital** letters, but should be all caps for style's sake.

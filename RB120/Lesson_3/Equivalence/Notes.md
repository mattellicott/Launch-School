**==**

The `==` method compares the **values** of two variables.<br>

The original `==` method is defined in the `BasicObject` class, which is the parent class for all classes in Ruby. This implies every object in Ruby has a `==` method. However, each class should define the `==` method to specify the value to compare.

<br><br>
**===**

If the caller of the `===` method is a group, the method asks if the argument that is passed in is a member of that group.<br>
Ex.. `(0..25) === 15` => true<br>
This is because `15` is part of the range `0..25`.<br>
Ex.. `String === 'Hello'` => true<br>
This is because `'Hello'` is an instance of `String`.

<br><br>
**equal?**


The `equal?` method determines if two **variables** contain the **same value** and if they **point** to the same **object**.<br>

<br><br>
**eql?**


The `eql?` method determines if two **objects** contain the **same value** and if they're of the **same class**.<br>
It is used **implicitly** by `Hash`. Rarely used **explicitly**.

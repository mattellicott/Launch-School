**Instance Variables** behave the way we'd expect. The only thing to watch out for is to make sure the instance variable is initialized before referencing it.<br>

**Class Variables** have a very insidious behavior of allowing sub-classes to override super-class class variables. Further, the change will affect all other sub-classes of the super-class. This is extremely unintuitive behavior, forcing some Rubyists to eschew using class variables altogether.<br>

**Constants** have lexical scope which makes their scope resolution rules very unique compared to other variable types. If Ruby doesn't find the constant using lexical scope, it'll then look at the inheritance hierarchy.

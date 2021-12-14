Objects that are stored as state within another object are also called **"collaborator objects"**. We call such objects collaborators because they work in conjunction (or in collaboration) with the class they are associated with.

Example:<br>
bob = Person.new("Robert")<br>
bud = Bulldog.new<br>
bob.pet = bud   # `bud` is an object pointing to the Bulldog class and it is stored in the state of the `bob` object.

<br>
When working with collaborator objects in your class, you may be working with strings, integers, arrays, hashes, or even custom objects. Collaborator objects allow you to chop up and modularize the problem domain into cohesive pieces; they are at the core of OO programming and play an important role in modeling complicated problem domains.

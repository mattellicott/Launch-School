# DRY (Don't Repeat Yourself) - Common Ruby term. It means that if you have logic that is commonly reused,
#                               then you should find a way to extract it to one place.


# Inheritance, Superclass/Subclass, super
class Animal # 'Animal' represents a superclass
end

class GoodDog < Animal # 'GoodDog' represents a subclass that inherits the 'Animal' Class

  def some_method(a, b)
    # super    # By default, 'super' sends all of the arguments to the 'some_method' method that is found in the superclass
    # super()  # With empty '()', 'super' will not send any arguments
    # super(a) # As expected, 'super' would send 'a', but not 'b'
  end
end


# Modules
# Common naming convention is to use 'able' as the suffix on whatever verb describes the behavior that the module is modeling.
#    Examples:    swim --> Swimmable    ||    walk --> Walkable
module Swimmable # This is a Module that can be mixed into a class
  def swim
    "I'm swimming!"
  end
end

class Animal; end # Superclass

class Fish < Animal # Subclass of Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal # Subclass of Animal
end

class Cat < Mammal # Subclass of Mammal which is a Subclass of Animal
end

class Dog < Mammal # Subclass of Mammal which is a Subclass of Animal
  include Swimmable         # mixing in Swimmable module
end



# Class inheritance referse to 'subclass < superclass'. Only 1 superclass can be inherited.
# Interface inheritance refers to mixing in modules.

####### When to use class inheritance vs interface inheritance(mixins)
# You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.
# If there's an "is-a" relationship, class inheritance is usually the correct choice. If there's a "has-a" relationship, interface inheritance is generally a better choice. For example, a dog "is an" animal and it "has an" ability to swim.
# You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.


# 'ancestors' method can be called on a class to see the Method Lookup Path
# The Lookup Path starts with the class it is called on, then the last to first included module, then repeats
# the process on the class that is inherited by the class it was called on, and so on.


# Some common uses for Modules
    # Namespacing - Using modules to organize similar classes
    module Mammal
      class Dog
        def speak(sound)
          p "#{sound}"
        end
      end

      class Cat
        def say_name(name)
          p "#{name}"
        end
      end
    end

    # Container - modules can be used as a container for methods, especially methods that seem out of place
    module Mammal
      ...

      def self.some_out_of_place_method(num)
        num ** 2
      end
    end

    value = Mammal.some_out_of_place_method(4) # Container methods can be called either way
    value = Mammal::some_out_of_place_method(4)



# Method Access Control - Public, Private, Protected Methods
#     Methods in classes are available to the rest of the program if
#     Public    - Available to throughout the program if you know the class or object name
#     Private   - Only available to the methods in the class they are defined in
#                 The private methods must be called without using 'self'
#     Protected - From inside the class, protected methods are accessible just like public methods.
#                 From outside the class, protected methods act just like private methods.
#
#     All of the methods are Public by default. Use the 'private' or 'protected' method, like a
#     keyword, and everything that comes after it will then fall into that category, until the
#     'private' or 'protected' method is called again.
#

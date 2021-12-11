# A Module basically allows sharing of methods between different classes.
# If you know you will need to use a method within multiple classes, you can
# invoke the `include` method with the module that the method belongs to.

# Modules are also used as a namespace.

module RandomModule
end

class RandomClass
  include RandomModule
end

empty_object = RandomClass.new

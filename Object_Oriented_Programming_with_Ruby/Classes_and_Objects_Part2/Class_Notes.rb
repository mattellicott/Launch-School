class GoodDog
  DOG_YEARS = 7 # Constant variable initialized. Not accessible outside of the Class.

  attr_accessor :name, :age
  @@number_of_dogs = 0 # Initializing a Class variable with '@@'

  def initialize
    @@number_of_dogs += 1
    @name = n
    @age  = a * DOG_YEARS
   end

  def self.total_number_of_dogs # Initializing a Class method with 'self.'
    @@number_of_dogs                # Methods defined in a class without the 'self.' are Instance methods
  end

  def to_s # Overrides the default 'to_s' method that is provided to every Class
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new # Instantiating a new object, which calls the initialize method in the Class
dog2 = GoodDog.new # Same as above

puts GoodDog.total_number_of_dogs   # => 2

# 'puts' calls the 'to_s' method on the provided argument. This line is equvalent to 'puts sparky.to_s'
# 'to_s' is also automatically called in string interpolation
puts sparky      # => This dog's name is Sparky and is 28 in dog years.

# 'p' calls the 'inspect' method on the provided argument. This line is equivalent to 'p sparky.inspect'
p sparky         # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>



# 'self'
#   Inside of an instance method, references the instance (object) that called the method - the calling object.
#   Therefore, 'self.weight=' is the same as 'sparky.weight=', in our example.
#
#   Outside of an instance method, references the class and can be used to define class methods.
#   Therefore if we were to define a name class method, def 'self.name=(n)' is the same as 'def GoodDog.name=(n)'.

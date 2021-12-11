class CamelCase # CamelCase is the proper naming style for classes
  attr_accessor :name, :height, :weight # Provides the functionality of "getter" and a "setter" methods.
  # attr_reader :name # Provides the functionality of the "getter" method only.
  # attr_writer :name # Provides the functionality of the "setter" method only.

  # def initialize(name) # The initialize method is called every time a object is created with the class. Ex.. CamelCase.new
  #   @name = name # name was passed in as a argument to the initialize method. The instance variable, @name is initialized to name
  # end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  # def name # This would return the @name instance variable when the get_name method is called on a CamelCase object
  #   @name       # This method is considered a "getter" method
  # end
  #
  # def name=(name) # This would assign the @name instance variable to the argument passed in. Ex.. sparky.name = 'Spartacus'
  #   @name = name         # name= is considered a "setter" method. It will always return the value that was passed in as
  # end                     # an argument, regardless of what the last line of the block definition is.

  def speak
    "#{@name} says arf!"
    # "#{name} says arf!" # This can be used alternatively since it calls the name method and returns the value of @name
  end

  def change_info(n, h, w)
    self.name = n # 'self' lets Ruby know that a 'setter' method is being called rather than just initializing a new local variable
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = CamelCase.new("Sparky") # "Sparky" is passed from the new method to the initialize method

puts sparky.speak # The speak method is called on the object that sparky points to
puts sparky.name

sparky.name = "Spartacus"

puts sparky.name

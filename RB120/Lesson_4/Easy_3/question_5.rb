class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

# Line 11 instantiates `tv` as an instance of the `Television` class.
# Line 12 calls the `manufacturer` method on the object `tv` references. Since
#   there is no `manufacturer` instance method, a NoMethodError is returned.
# Line 13 calls the `model` method on the object `tv` references and executes
#   the instance method.
# Line 15 calls the `manufacturer` class method on the `Television` class and
#   executes it.
# Line 16 calls the `model` class method on the `Television` class. Since there
#   is no `model` class method, a NoMethodError is returned.

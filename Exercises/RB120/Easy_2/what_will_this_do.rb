class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

# On line 15, `thing` is initialized to the `Something` class.
# On line 16, `puts` is called and accepts the return of the class method `dupdata`
#     being called, which is `'ByeBye'`
# On line 17, `puts` is called and accepts the return of the instance method `dupdata`
#     being called on the object that `thing` references. The return is the result of
#     concatenating the instance variable `@data` onto itself. Since `@data` is
#     initialized to the String `Hello` on line 3, the return of line 17 is `'HelloHello'`

# Output:
# ByeBye
# HelloHello

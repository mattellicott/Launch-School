class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Define a new method
# def self.hi
#   greeting = Greeting.new
#   greeting.greet("Hello")
# end

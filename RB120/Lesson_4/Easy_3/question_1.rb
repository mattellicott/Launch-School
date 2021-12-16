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

hello = Hello.new
hello.hi

# `hello` is instantiated to an instance of the `Hello` class.
# Then, the `hi` method is called on `hello`, which calls the `greet` method,
# passing in `"Hello"` as an argument. Since there is no `greet` method in the
# `Hello` class, it looks further up the method chain, into the `Greeting` class,
# and calls the `greet` method there. `greet` finally calls the `puts` method
# with `"Hello"`, printing `Hello`.

hello = Hello.new
hello.bye

# `hello` is instantiated to an instance of the `Hello` class.
# Then, the `bye` method is called on `hello`. Since `bye` can't be found in the
# lookup chain, a `NoMethodError` is returned.

hello = Hello.new
hello.greet

# `hello` is instantiated to an instance of the `Hello` class.
# Then, the `greet` method is called on `hello`. Since there is no `greet`
# method in the `Hello` class, it looks further up the method chain, into the
# `Greeting` class, and calls the `greet` method there. Since `greet` was called
# without and arguments, and `greet` expects 1 argument, an ArgumentError is returned.

hello = Hello.new
hello.greet("Goodbye")

# `hello` is instantiated to an instance of the `Hello` class.
# Then, the `greet` method is called on `hello`. Since there is no `greet`
# method in the `Hello` class, it looks further up the method chain, into the
# `Greeting` class, and calls the `greet` method there. Since `greet` was called
# with `"Goodbye"` passed in as an argument, it prints `Goodbye`.

Hello.hi

# The class method `hi` is called on `Hello`. Since there is no matching class
# method, a NoMethodError is returned.

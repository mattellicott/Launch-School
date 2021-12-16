class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# The above example is the preferred style. It uses a `attr_accessor` to create
# a `getter` method which is what line 9 uses to `get` the `@template` instance
# variable.

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# This example has the same effect, but is not preferred for readability.

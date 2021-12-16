class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# `return` is unnecessary since the last line of the `self.information` method
#   definition would be returned by default.
# `attr_accessor` is unnecessary unless we want to `set` and `get` the values of
#   `@brightness` or `@color`.

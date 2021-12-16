class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# Change `light_status` to `status`.
# When calling the method, the user should know what class the calling object
# belongs to, so having `light` in the method name is redundant and less readable.

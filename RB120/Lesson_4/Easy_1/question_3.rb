module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# On line 3, `self.class` returns the class of the calling object. Since `self`
# references the object `small_car` points to, it is like saying `small_car.class`.
# Since `small_car` was instantiated with the `Car` class, `small_car.class` returns
# `Car`.

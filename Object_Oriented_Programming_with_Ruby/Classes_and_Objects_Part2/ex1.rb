class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(n)
    @current_speed += n
    puts "You push the gas and accelerate #{n} mph."
  end

  def brake(n)
    @current_speed -= n
    puts "You push the brake and decelerate #{n} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    puts "Your #{self.color} car has been spray painted #{color}."
    self.color = color
  end

  def self.calc_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

MyCar.calc_mileage(10, 50)

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@vehicle_count = 0

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@vehicle_count += 1
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

  def to_s
    "Your vehicle is a #{@color} #{@year} #{@model}"
  end

  def self.total_vehicles
    puts "You have #{@@vehicle_count} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def age
    puts "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina
lumina.age

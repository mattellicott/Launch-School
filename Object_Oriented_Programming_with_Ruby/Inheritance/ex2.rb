class Vehicle
  @@vehicle_count = 0

  def initialize
    @@vehicle_count += 1
  end

  def self.total_vehicles
    puts "You have #{@@vehicle_count} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

honda = MyCar.new
ford = MyTruck.new

Vehicle.total_vehicles

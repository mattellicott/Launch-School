class Pet
  attr_reader :species, :name

  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Owner
  attr_accessor :number_of_pets, :pets
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end
end

class Shelter
  attr_accessor :owners

  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    @owners << owner unless @owners.find { |v| v == owner }
    owner.pets << [pet.species, pet.name]
    owner.number_of_pets += 1
  end

  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet[0]} name #{pet[1]}"
      end
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

class Cat
  @@total_cats = 0

  def initialize
    @@total_cats += 1
  end

  def self.total
    puts "There are #{@@total_cats} total cats!"
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

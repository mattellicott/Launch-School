class Person
  attr_accessor :last_name
  attr_reader :first_name

  def initialize(name)
    name_arr = name.split
    @first_name = name_arr[0] if name_arr[0]
    @last_name = name_arr[1] if name_arr[1]
  end

  def name
    "#{first_name} #{last_name}"
  end

end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

class Student
  # attr_accessor :name
  # attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def report_card
    puts "#{@name}'s grade is #{@grade}."
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new('Joe', 100)
bob = Student.new('Bob', 90)

joe.report_card
bob.report_card

puts "Well done!" if joe.better_grade_than?(bob)

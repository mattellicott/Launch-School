# FURTHER EXPLORATION
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# `attr_reader` creates a `getter` method
# `attr_writer` creates a `setter` method
# `attr_accessor` creates both `getter` and `setter` methods

# To execute lines 14-16, we only needed a `getter` method.
# It would have worked if we had used `attr_accessor`, but it was unnecessary
# since we currently have no need for a `setter` method.

# Manually defining the `title` and `author` methods wouldn't change the
# the behavior. The only advantage would be if we wanted to modify the output of
# the variable.

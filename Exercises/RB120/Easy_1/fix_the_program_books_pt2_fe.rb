# FURTHER EXPLORATION
class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# I prefer the way used in the previous exercise.
# Generally speaking, a book does not need to be renamed, nor does the name of
# the author need to be changed. Because of this, I see no reason to allow
# changes to be made to the state of the object.

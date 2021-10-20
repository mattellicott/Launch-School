# def print_in_box(string)
#   outer_line = "+-#{'-' * string.size}-+"
#   inner_line = "| #{' ' * string.size} |"
#
#   puts outer_line
#   puts inner_line
#   puts "| #{string} |"
#   puts inner_line
#   puts outer_line
# end

# # Truncate
# def print_in_box(string)
#   string = string[0..76]
#   outer_line = "+-#{'-' * string.size}-+"
#   inner_line = "| #{' ' * string.size} |"
#
#   puts outer_line
#   puts inner_line
#   puts "| #{string} |"
#   puts inner_line
#   puts outer_line
# end

# Word Wrap
def print_in_box(string)
  partitions = (string.size / 76.0).ceil
  partition_size = string.size / partitions
  outer_line = "+-#{'-' * (partition_size + 1)}-+"
  inner_line = "| #{' ' * (partition_size + 1)} |"
  last = 0

  puts outer_line
  puts inner_line
  while partitions > 0
    message_line = string[last..last + partition_size].ljust(partition_size + 1)
    message_line = message_line.chars.rotate.join if message_line[0] == ' '
    puts format("| %#{partition_size}s |", message_line)
    last += partition_size + 1
    partitions -= 1
  end
  puts inner_line
  puts outer_line
end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
print_in_box('It was the best of times, it was the worst of times, it was the '\
             'age of wisdom, it was the age of foolishness, it was the epoch '\
             'of belief, it was the epoch of incredulity, it was the season of'\
             ' Light, it was the season of Darkness, it was the spring of '\
             'hope, it was the winter of despair. -Charles Dickens, A Tale of '\
             'Two Cities')

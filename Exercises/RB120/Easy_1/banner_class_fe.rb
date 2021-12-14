# FURTHER EXPLORATION
require 'io/console'

class Banner
  def initialize(message, width)
    minwidth = message.size
    maxwidth = IO.console.winsize[1] - 4

    @message = message
    until width.between?(minwidth, maxwidth)
      print "Width was invalid, please enter a number between " \
            "#{minwidth - 1} and #{maxwidth + 1}: "
      width = gets.to_i
    end
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 166)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('', -1)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

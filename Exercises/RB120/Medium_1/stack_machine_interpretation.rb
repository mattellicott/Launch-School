require 'pry'
class Minilang
  attr_accessor :register, :stack
  attr_reader :commands

  def initialize(commands)
    @register = 0
    # @commands = commands.split.each { |command| interpreter(command) }
    @stack = []
    @commands = commands
  end

  def eval
    binding.pry
    self.register = 'blah'
    # commands.split.each do |command|
    #   binding.pry
    #   case command
    #   when /\d/    then register = command.to_i
    #   when 'PUSH'  then stack.unshift(register)
    #   when 'ADD'   then register += stack.shift
    #   when 'SUB'   then register -= stack.shift
    #   when 'MULT'  then register *= stack.shift
    #   when 'DIV'   then register /= stack.shift
    #   when 'MOD'   then register %= stack.shift
    #   when 'POP'   then register = stack.shift
    #   when 'PRINT' then puts register
    #   end
    # end
  end

  def integer

  end

  def push

  end

  def add

  end

  def sub

  end

  def mult

  end

  def div

  end

  def mod

  end

  def pop

  end

  def print

  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

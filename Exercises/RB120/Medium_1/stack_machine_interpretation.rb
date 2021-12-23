class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  def initialize(commands)
    @register = 0
    @stack = []
    @commands = commands.split
  end

  def eval
    @commands.each do |command|
      case command
      when /\d/    then @register = command.to_i
      when 'PUSH'  then push
      when 'ADD'   then add
      when 'SUB'   then sub
      when 'MULT'  then mult
      when 'DIV'   then div
      when 'MOD'   then mod
      when 'POP'   then pop
      when 'PRINT' then print_register
      else raise BadTokenError, "Invalid token: #{command}"
      end
    end
  end

  private

  attr_accessor :register, :stack

  def push
    @stack.unshift(register)
  end

  def add
    @register += stack.shift
  end

  def sub
    @register -= stack.shift
  end

  def mult
    @register *= stack.shift
  end

  def div
    @register /= stack.shift
  end

  def mod
    @register %= stack.shift
  end

  def pop
    raise EmptyStackError, "Empty stack!" if stack.empty?
    @register = stack.shift
  end

  def print_register
    puts register
  end
end

Minilang.new('PRINT').eval
Minilang.new('5 PUSH 3 MULT PRINT').eval
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
Minilang.new('-3 PUSH 5 SUB PRINT').eval
Minilang.new('6 PUSH').eval
# 0
# 15
# 5
# 3
# 8
# 10
# 5
# 6
# 12
# 8
# (nothing printed; no PRINT commands)

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

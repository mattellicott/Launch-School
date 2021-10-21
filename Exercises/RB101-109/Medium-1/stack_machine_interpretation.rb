def minilang(commands)
  register = 0
  stack = []

  commands.split.each do |command|
    case command
    when /\d/    then register = command.to_i
    when 'PUSH'  then stack.unshift(register)
    when 'ADD'   then register += stack.shift
    when 'SUB'   then register -= stack.shift
    when 'MULT'  then register *= stack.shift
    when 'DIV'   then register /= stack.shift
    when 'MOD'   then register %= stack.shift
    when 'POP'   then register = stack.shift
    when 'PRINT' then puts register
    end
  end
end

#minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
# (3 + (4 * 5) - 7) / (5 % 3) == 8

# minilang('PRINT')
# # 0
# minilang('5 PUSH 3 MULT PRINT')
# # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# minilang('5 PUSH POP PRINT')
# # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
# minilang('-3 PUSH 5 SUB PRINT')
# # 8
# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

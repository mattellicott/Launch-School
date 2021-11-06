# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.get()
# Kernel.puts(answer)
require 'yaml'
PROMPTS = YAML.load_file('calculator.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  message = case op
            when '1'
              PROMPTS['add']
            when '2'
              PROMPTS['sub']
            when '3'
              PROMPTS['mul']
            when '4'
              PROMPTS['div']
            end
  # More code here
  message
end

prompt(PROMPTS['greeting'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(PROMPTS['valid_name'])
  else
    break
  end
end

prompt("#{PROMPTS['hi']} #{name}!")

loop do # Main Loop
  number1 = ''
  loop do
    prompt(PROMPTS['num1'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(PROMPTS['invalid_num'])
    end
  end

  number2 = ''
  loop do
    prompt(PROMPTS['num2'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(PROMPTS['invalid'])
    end
  end

  prompt(PROMPTS['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(PROMPTS['choose'])
    end
  end

  prompt("#{operation_to_message(operator)} #{PROMPTS['op_to_msg']}")
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{PROMPTS['res']} #{result}")

  prompt(PROMPTS['repeat_op'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(PROMPTS['bye'])

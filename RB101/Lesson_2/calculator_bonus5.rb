# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.get()
# Kernel.puts(answer)
require 'yaml'
MESSAGES = YAML.load_file('calculator_int.yml')
language = 'en'

def messages(message, lang=language)
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt(messages('lang', language))
loop do
  lang_choice = Kernel.gets().chomp()
  case lang_choice
  when '1'
    language = 'en'
    break
  when '2'
    language = 'es'
    break
  else
    prompt(messages('invalid_num', language))
  end
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

def operation_to_message(op, language)
  message = case op
            when '1'
              messages('add', language)
            when '2'
              messages('sub', language)
            when '3'
              messages('mul', language)
            when '4'
              messages('div', language)
            end
  # More code here
  message
end

prompt(messages('greeting', language))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', language))
  else
    break
  end
end

prompt("#{messages('hi', language)} #{name}!")

loop do # Main Loop
  number1 = ''
  loop do
    prompt(messages('num1', language))
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(messages('invalid_num', language))
    end
  end

  number2 = ''
  loop do
    prompt(messages('num2', language))
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(messages('invalid', language))
    end
  end

  prompt(messages('operator_prompt', language))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose', language))
    end
  end

  prompt("#{operation_to_message(operator, language)} #{messages('op_to_msg', language)}")
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

  prompt("#{messages('res', language)} #{result}")

  prompt(messages('repeat_op', language))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('bye', language))

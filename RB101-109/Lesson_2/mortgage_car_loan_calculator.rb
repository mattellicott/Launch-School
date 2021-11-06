require 'yaml'
MESSAGES = YAML.load_file('mortgage_car_loan_calculator.yml')

def prompt(message)
  print(message)
end

def get_valid_number(message, can_be_zero: false)
  prompt(MESSAGES[message])
  num = ''
  loop do
    num = gets.chomp
    if (message == 'months') || (message == 'years')
      num = num.to_i
      # Break if input is > 0, or is 0 AND can_be_zero is TRUE
      break if (num > 0) || ((num == 0) && can_be_zero)
    else
      num = num.to_f
      break if num.positive?
    end
    prompt(MESSAGES['invalid'])
  end
  num
end

def calc_duration(years, months)
  ((years * 12) + months).to_i
end

def calc_payments(amount, apr, duration)
  (amount * (apr / (1 - (1 + apr)**(-duration)))).round(2)
end

def run_again?
  prompt(MESSAGES['run_again'])
  loop do
    case gets.chomp.downcase
    when 'y', 'yes'
      return true
    when 'n', 'no'
      puts "Goodbye!"
      return false
    end
    prompt(MESSAGES['invalid'])
  end
end

# Main loop
loop do
  system("clear")
  prompt(MESSAGES['welcome'])

  # Prompt for, and retrieve data
  loan_amount = get_valid_number('loan')
  loan_apr = (get_valid_number('apr') / 12) / 100
  loan_duration_years = get_valid_number('years', can_be_zero: true)
  loan_duration_months = if loan_duration_years > 0
                           get_valid_number('months', can_be_zero: true)
                         else
                           get_valid_number('months', can_be_zero: false)
                         end

  # Perform calculations
  loan_duration = calc_duration(loan_duration_years, loan_duration_months)
  monthly_payment = calc_payments(loan_amount, loan_apr, loan_duration)

  # Print results
  puts "\nMonthly interest rate: #{format('%11.10s', loan_apr)}%"
  puts "Loan duration: #{format('%13.10s', loan_duration)} months"
  puts "Monthly payment: #{format('%18.11s', "\$#{monthly_payment}")}\n\n"

  break unless run_again?
end

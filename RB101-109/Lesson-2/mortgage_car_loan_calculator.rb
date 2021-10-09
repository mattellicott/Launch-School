require 'yaml'
PROMPTS = YAML.load_file('mortgage_car_loan_calculator.yml')

def prompt(message)
  print(message)
end

def get_valid_number(duration = 'false')
  num = ''
  loop do
    num = gets.chomp
    num = case num.scan(/\D/)
          when []
            num.to_f
          else
            -1
          end
    # Break if num is 0 and a duration
    break if (num == 0) && (duration == 'true')
    # Otherwise, break if num is positive
    break if num.positive?
    prompt(PROMPTS['invalid'])
  end
  num
end

# Prompt for, and retrieve data
prompt(PROMPTS['loan'])
loan_amount = get_valid_number()
prompt(PROMPTS['apr'])
loan_apr = (get_valid_number() / 12) / 100
prompt(PROMPTS['years'])
loan_duration_years = get_valid_number('true')
prompt(PROMPTS['months'])
loan_duration_months = get_valid_number('true')

# Perform Calculations
loan_duration = ((loan_duration_years * 12) + loan_duration_months).to_i
monthly_payment = (loan_amount * (loan_apr /
                  (1 - (1 + loan_apr)**(-loan_duration)))).round(2)

# Print results
puts "\nMonthly interest rate: #{format('%11.10s', loan_apr)}%"
puts "Loan duration: #{format('%13.10s', loan_duration)} months"
puts "Monthly payment: #{format('%18.11s', "\$#{monthly_payment}")}"

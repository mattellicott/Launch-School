def valid_number?(string, int=0, duration='false')
  until int.positive?
    print "Enter a valid #{string}: "
    int = gets.to_f
    break if (int >= 0) && (duration == 'true')
  end
  int
end

loan_amount = valid_number?('loan amount')
loan_apr = (valid_number?('Annual Percentage Rage (APR)(e.g., 6)') / 12) / 100
loan_duration_years = valid_number?('loan duration in Years', 0, 'true')
loan_duration_months = valid_number?('remainder of the loan duration in Months',
                                     0, 'true')

loan_duration = (loan_duration_years * 12) + loan_duration_months
monthly_payment = loan_amount * (loan_apr / (1 - (1 + loan_apr)**(-loan_duration)))

puts "\nMonthly interest rate: #{format('%11.10s', loan_apr)}%"
puts "Loan duration: #{format('%13.10s', loan_duration.to_i)} months"
puts "Monthly payment: #{format('%18.11s', "\$#{monthly_payment.round(2)}")}"

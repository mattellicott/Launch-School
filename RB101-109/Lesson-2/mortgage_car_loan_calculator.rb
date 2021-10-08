def valid_number?(string,int=0,months=false)
  until int.positive?
    print "Enter a valid #{string}: "
    int = gets.to_f
    break if (int >= 0) && (months == true)
  end
  int
end

loan_amount = valid_number?('loan amount')
loan_apr = (valid_number?('Annual Percentage Rage (APR)(e.g., 6)') / 12) / 100
loan_duration_years = valid_number?('loan duration in Years')
loan_duration_months = valid_number?('remainder of the loan duration in Months',0,true)

loan_duration = (loan_duration_years * 12) + loan_duration_months
monthly_payment = loan_amount * (loan_apr / (1 - (1 + loan_apr)**(-loan_duration)))

puts "\nMonthly interest rate: " + sprintf("%12.10s","#{loan_apr.to_s}%")
puts "Loan duration: " + sprintf("%20.10s","#{loan_duration.to_i.to_s} months")
puts "Monthly payment: " + sprintf("%18.11s","\$#{monthly_payment.round(2).to_s}")

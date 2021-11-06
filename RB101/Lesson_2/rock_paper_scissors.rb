VALID_CHOICES = ['rock', 'paper', 'scissors']

def test_method
  prompt('test message')
end

# Won't work here because test_method is calling prompt before prompt has been
# defined
# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Will work here because test_method is calling prompt after prompt has been
# defined
# test_method

def results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    "You won!"
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    "You lost!"
  else
    "It's a tie!"
  end
end

choice = ''
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  prompt(results(choice, computer_choice))


  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

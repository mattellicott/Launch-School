VALID_CHOICES_SHORT = %w(r p sc sp l)
VALID_CHOICES_NORMAL = %w(ROCK PAPER SCISSORS SPOCK LIZARD)
ROUNDS_TO_WIN = 3
RESULT = {
  ROCK: { ROCK: 'Tie', PAPER: 'Lose', SCISSORS: 'Win', SPOCK: 'Lose',
          LIZARD: 'Win' },
  PAPER: { ROCK: 'Win', PAPER: 'Tie', SCISSORS: 'Lose', SPOCK: 'Win',
           LIZARD: 'Lose' },
  SCISSORS: { ROCK: 'Lose', PAPER: 'Win', SCISSORS: 'Tie',
              SPOCK: 'Lose', LIZARD: 'Win' },
  SPOCK: { ROCK: 'Win', PAPER: 'Lose', SCISSORS: 'Win', SPOCK: 'Tie',
           LIZARD: 'Lose' },
  LIZARD: { ROCK: 'Lose', PAPER: 'Win', SCISSORS: 'Lose',
            SPOCK: 'Win', LIZARD: 'Tie' }
}

def prompt(string)
  print "#{string} => "
end

def greeting
  system("clear")
  puts <<-MSG
  Welcome to Rocks, Paper, Scissors, Spock, Lizard!\n\n
  RULES:

  ROCK beats Scissors and Lizard.
  PAPER beats Rock and Spock.
  SCISSORS beats Paper and Lizard.
  SPOCK beats Rock and Scissors.
  LIZARD beats Paper and Spock.

  Each weapon is ineffective against itself.
  You will be playing against the Computer.
  First to 3 wins becomes the Grand Winner!\n\n

  Press ENTER to continue.
  MSG
  gets
end

def choose_your_weapon
  choice = ''
  loop do
    prompt("Choose one: (R)ock, (P)aper, (Sc)issors, (Sp)ock, or (L)izard")
    choice = gets.chomp

    if choice_is_valid?(choice)
      system("clear")
      return choice
    else
      puts("That's not a valid choice.\n")
    end
  end
end

def choice_is_valid?(string)
  string = string.scan(/\D/).join.downcase
  VALID_CHOICES_SHORT.each { |x| return true if string.start_with?(x) }
  false
end

def normalize_player_choice(string)
  index = 0
  string = string.scan(/\D/).join.downcase
  VALID_CHOICES_SHORT.each do |x|
    return VALID_CHOICES_NORMAL[index] if string.start_with?(x)
    index += 1
  end
  false
end

def tally_score(num1, num2)
  RESULT[:"#{num1}"][:"#{num2}"] == 'Win' ? 1 : 0
end

def play_again?
  prompt("Do you want to play again ? (Y)es or (N)o")
  loop do
    case gets.chomp.downcase
    when 'y', 'yes'
      return true
    when 'n', 'no'
      return false
    end
    prompt("That is a not a valid choice.")
  end
end

def display_round(player, computer)
  player_result = RESULT[:"#{player}"][:"#{computer}"]
  computer_result = RESULT[:"#{computer}"][:"#{player}"]
  puts "#########################################"
  puts "# PLAYER: #{format('%8s', player.to_s)} "\
       "# COMPUTER: #{format('%8s', computer.to_s)} #"
  puts "##{format('%11s', player_result.to_s)}!      "\
       "# #{format('%10s', computer_result.to_s)}! #{format('%8s', '#')}"
end

def display_score(player, computer)
  puts "# PLAYER: #{format('%8s', player.to_s)} "\
       "# COMPUTER: #{format('%8s', computer.to_s)} #"
  puts "#########################################"
  puts "Press ENTER to continue."
  gets
  system("clear")
end

def game_over?(player, computer)
  (player == 3) || (computer == 3)
end

def display_grand_winner(player, computer)
  puts "YOU ARE THE GRAND WINNER!" if player == ROUNDS_TO_WIN
  puts "THE COMPUTER IS THE GRAND WINNER!" if computer == ROUNDS_TO_WIN
end

greeting()
# Main loop
loop do
  system("clear")
  player_score = 0
  computer_score = 0
  loop do
    player_choice = normalize_player_choice(choose_your_weapon())
    computer_choice = VALID_CHOICES_NORMAL.sample

    player_score += tally_score(player_choice, computer_choice)
    computer_score += tally_score(computer_choice, player_choice)

    display_round(player_choice, computer_choice)
    display_score(player_score, computer_score)
    display_grand_winner(player_score, computer_score) if (player_score == 3) ||
                                                          (computer_score == 3)

    break if game_over?(player_score, computer_score)
  end

  break unless play_again?()
end
puts "Thank you for playing. Goodbye!"

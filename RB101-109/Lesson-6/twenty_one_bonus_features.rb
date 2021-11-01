RULES = [<<-R1, <<-R2, <<-R3, <<-R4]
RULES OF TWENTY-ONE           PAGE 1 of 4

1. The goal of Twenty-One is to try to
get as close to 21 as possible, without
going over. If you go over 21, it's a
"bust" and you lose.

2. Setup: the game consists of a "dealer"
and a "player". Both participants are
initially dealt 2 cards. The player can
see their 2 cards, but can only see one
of the dealer's cards.

R1
RULES OF TWENTY-ONE           PAGE 2 of 4

3. Player turn: the player goes first,
and can decide to either "hit" or
"stay". A hit means the player will ask
for another card. Remember that if the
total exceeds 21, then the player
"busts" and loses.

R2
RULES OF TWENTY-ONE           PAGE 3 of 4

4. Dealer turn: when the player stays,
it's the dealer's turn. The dealer must
follow a strict rule for determining
whether to hit or stay: hit until the
total is at least 17. If the dealer
busts, then the player wins.

R3
RULES OF TWENTY-ONE           PAGE 4 of 4

5. Comparing cards: when both the
player and the dealer stay, it's time
to compare the total value of the cards
and see who has the highest value.

              CARD VALUES

      2-10             face value
      J,Q,K                    10
      ACE                 1 or 11

R4

CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def initialize_game!(data)
  initialize_round!(data)
  data[:round] = 1
  data[:dealer_score] = 0
  data[:player_score] = 0
end

def initialize_round!(data)
  data[:deck] = initialize_deck
  data[:dealer] = []
  data[:player] = []
  data[:current_player] = 'player'
  data[:dealer_total] = 0
  data[:player_total] = 0
  data[:busted] = nil
end

def initialize_deck
  result = []
  ['C', 'D', 'H', 'S'].each { |s| CARDS.each { |c| result << [s, c] } }
  result
end

def remove_suit!(card)
  card.delete_at(0)
end

def deal_card!(data)
  data[data[:current_player].to_sym]
    .prepend(data[:deck].delete(data[:deck].sample))
end

def hit(data, alternate: false)
  deal_card!(data)
  remove_suit!(data[data[:current_player].to_sym].first)
  data["#{data[:current_player]}_total".to_sym] =
    hand_value(data[data[:current_player].to_sym])
  alternate_player!(data[:current_player]) if alternate
end

def alternate_player!(player)
  player.replace(player == 'player' ? 'dealer' : 'player')
end

def hand_value(hand)
  result = hand.flatten.reject { |c| c == 'A' }.map do |card|
    card.match(/J|Q|K/).to_a.size > 0 ? 10 : card.to_i
  end.sum
  add_aces(result, hand.flatten.count('A'))
end

def add_aces(result, ace_count)
  if ace_count.positive?
    (ace_count - 1).times { result += 1 }
    result += if result + 11 > 21
                1
              else
                11
              end
  end
  result
end

def player_turn(data)
  loop do
    puts "Enter (H)it, (S)tay, or (Q)uit."
    case gets.chomp.downcase
    when 'h', 'hit'
      player_output(data, 'hits')
      hit(data)
      display_game(data)
    when 's', 'stay' then return player_output(data, 'stays')
    when 'q', 'quit' then return 'quit'
    else
      invalid_choice(data)
    end
    return busted!(data, 'Player') if bust?(data)
  end
end

def dealer_turn(data)
  display_game(data)
  sleep(1)
  while data[:dealer_total] < 17
    dealer_hits(data)
  end
  display_game(data)
  if bust?(data)
    player_output(data, 'busts')
  else
    player_output(data, 'stays')
  end
end

def bust?(data)
  data["#{data[:current_player]}_total".to_sym] > 21
end

def dealer_hits(data)
  display_game(data)
  player_output(data, 'hits')
  hit(data)
  display_game(data)
  sleep(1)
end

def busted!(data, player)
  busted_output(data, player)
  data[:busted] = true
end

def busted_output(data, player)
  display_game(data)
  puts "#{player} busted!"
  sleep(1)
end

def display_game(data)
  system 'clear'
  puts round_output(data)
  puts "#{'PLAYER HANDS'.ljust(43)}TOTALS"
  if data[:current_player] == 'player'
    puts "Dealer: #{hidden_hand(data[:dealer])}"
  else
    puts "Dealer: #{full_hand(data[:dealer], data[:dealer_total])}"
  end
  puts "Player: #{full_hand(data[:player], data[:player_total])}\n\n"
end

def round_output(data)
  "#{format('ROUND: %2s', data[:round].to_s)}     "\
  "#{format('DEALER SCORE: %2s', data[:dealer_score].to_s)}   "\
  "#{format('PLAYER SCORE: %2s', data[:player_score].to_s)}\n\n"
end

def hidden_hand(hand)
  return "#{hand[0..-2].join(', ')}, and unknown card" if hand.size > 2
  "#{hand[0].first} and unknown card"
end

def full_hand(hand, total)
  if hand.size > 2
    format("#{"#{hand[0..-2].join(', ')}, and #{hand[-1].first}"
      .ljust(39)}%2s", total.to_s)
  else
    format("#{"#{hand[0].first} and #{hand[-1].first}"
      .ljust(39)}%2s", total.to_s)
  end
end

def invalid_choice(data)
  display_game(data)
  puts "Invalid choice! Try again.."
end

def player_output(data, string)
  display_game(data)
  puts "#{data[:current_player].capitalize} #{string}!"
  sleep(2)
end

def game_winner?(data)
  data[:player_score] == 5 || data[:dealer_score] == 5
end

def display_winner(data)
  if data[:dealer_score] == 5
    output_screen_center('The Dealer is the winner!')
  else
    output_screen_center('You are the winner!')
  end
end

def output_screen_center(string)
  system 'clear'
  puts "\n\n\n#{string.center(49)}\n\n\n"
  enter_to_continue
end

def enter_to_continue
  puts 'Press ENTER to continue.'
  gets
end

def dealer_won_round?(data)
  # display_game(data)
  return false if data[:dealer_total] > 21
  return true if data[:player_total] > 21
  data[:dealer_total] >= data[:player_total]
end

def play_again?(data)
  loop do
    puts "Play again? (Y)es or (N)o."
    case gets.chomp.downcase
    when 'y', 'yes' then return true
    when 'n', 'no' then return false
    else
      invalid_choice(data)
    end
  end
end

def goodbye
  system 'clear'
  puts "Goodbye!".center(31)
end

def end_round(data)
  puts "ROUND: #{data[:round]} OVER"
  enter_to_continue

  update_round_stats!(data)
end

def update_round_stats!(data)
  dealer_won_round?(data) ? data[:dealer_score] += 1 : data[:player_score] += 1
  data[:round] += 1
end

def display_rules
  RULES.each do |rule|
    system 'clear'
    puts rule
    enter_to_continue
  end
end

def display_begin
  output_screen_center("LET'S BEGIN!")
end

# Main Loop
display_rules
display_begin
loop do
  data = {}
  initialize_game!(data)

  loop do
    initialize_round!(data)
    4.times { hit(data, alternate: true) }

    display_game(data)
    break if player_turn(data) == 'quit'

    unless data[:busted]
      alternate_player!(data[:current_player])
      dealer_turn(data)
    end

    end_round(data)
    break if game_winner?(data)
  end
  display_winner(data)

  break unless play_again?(data)
end
goodbye

require 'pry'

CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def initialize_data
  { deck: initialize_deck, dealer: [], player: [], current_player: 'player',
    dealer_total: 0, player_total: 0 }
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
      display_hands(data)
    when 's', 'stay' then return player_output(data, 'stays')
    when 'q', 'quit' then return 'quit'
    else
      invalid_choice(data)
    end
    return busted!(data, 'Player') if bust?(data)
  end
end

def dealer_turn(data)
  display_hands(data)
  sleep(1)
  while data[:dealer_total] < 17
    dealer_hits(data)
  end
  display_hands(data)
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
  display_hands(data)
  player_output(data, 'hits')
  hit(data)
  display_hands(data)
  sleep(1)
end

def busted!(data, player)
  display_hands(data)
  puts "#{player} busted!"
  sleep(1)
  data[:busted] = true
end

def display_hands(data)
  system 'clear'
  puts "#{'PLAYER HANDS'.ljust(43)}TOTALS"
  if data[:current_player] == 'player'
    puts "Dealer: #{hidden_hand(data[:dealer])}"
  else
    puts "Dealer: #{full_hand(data[:dealer], data[:dealer_total])}"
  end
  puts "Player: #{full_hand(data[:player], data[:player_total])}"
end

def hidden_hand(hand)
  return "#{hand[0..-2].join(', ')}, and unknown card" if hand.size > 2
  "#{hand[0].first} and unknown card"
end

def full_hand(hand, total)
  if hand.size > 2
    format("#{"#{hand[0..-2].join(', ')}, and #{hand[-1].first}"
      .ljust(37)}%2s", total.to_s)
  else
    format("#{"#{hand[0].first} and #{hand[-1].first}"
      .ljust(37)}%2s", total.to_s)
  end
end

def invalid_choice(data)
  display_hands(data)
  puts "Invalid choice! Try again.."
end

def player_output(data, string)
  display_hands(data)
  puts "#{data[:current_player].capitalize} #{string}!"
  sleep(2)
end

def display_winner(data)
  display_hands(data)
  if dealer_won?(data)
    puts "The Dealer is the winner!"
  else
    puts "You are the winner!"
  end
end

def dealer_won?(data)
  # display_hands(data)
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

# Main Loop
loop do
  data = initialize_data
  4.times { hit(data, alternate: true) }

  display_hands(data)
  break if player_turn(data) == 'quit'

  unless data[:busted]
    alternate_player!(data[:current_player])
    dealer_turn(data)
  end
  display_winner(data)

  break unless play_again?(data)
end
goodbye

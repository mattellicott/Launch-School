require 'io/console'
module Displayable
  private

  def display_choices
    output_center("(H)it, (S)tay, or (Q)uit")
    center_cursor
  end

  def display_selection(message)
    display_board(extra_line: true)
    output_center_red(message)
    center_cursor
    sleep(1)
    reset_cursor
    display_board(extra_line: true)
    $stdin.iflush
  end

  def display_board(extra_line: false)
    verify_window_and_clear_screen
    display_stats
    display_hands
    puts "" if extra_line
  end

  def display_hands
    puts ""
    output_center("PLAYER HANDS                               TOTALS")
    output_center("Player: #{player}")
    output_center("Dealer: #{dealer}")
  end

  def display_stats
    output_center_red(stats.to_s)
  end

  def display_welcome_screen
    single_center_red("Welcome to Twenty-One!")
  end

  def display_rules
    single_center_red("These are the rules!")
  end

  def display_end_round_screen
    single_center_red("#{stats.round_winner} won Round #{stats.round}")
  end

  def display_winner_screen
    verify_window_and_clear_screen
    if stats.player_score == 5
      message1 = "YOU WON THE GAME!"
      message2 = "CONGRATULATIONS"
    else
      message1 = "YOU LOST THE GAME!"
      message2 = "BETTER LUCK NEXT TIME"
    end
    double_center_red(message1, message2)
  end

  def display_goodbye_screen
    verify_window_and_clear_screen
    double_center_red("Thanks for playing!", "Goodbye!")
  end
end

module DisplayableUtils
  private

  attr_accessor :window_width

  def initialize
    @window_width = $stdin.winsize[1]
  end

  def output_center(message, red_font: false)
    if red_font
      puts "\e[31m#{message.center(window_width)}\e[0m"
    else
      puts message.center(window_width)
    end
  end

  def output_center_red(message)
    output_center(message, red_font: true)
  end

  def center_cursor
    @cursor_pos = IO.console.cursor
    IO.console.cursor = [7, window_width / 2]
  end

  def reset_cursor
    IO.console.cursor = @cursor_pos
  end

  def press_key_to_continue
    puts ""
    output_center_red("*Press any key to continue*")
    $stdin.getch
  end

  def clear_screen
    system 'clear'
  end

  def verify_window_and_clear_screen
    update_window_width
    clear_screen
    until window_width >= 50
      output_center("Window width too narrow.")
      output_center("Increase by #{50 - window_width} columns to continue.")
      sleep(1)
      update_window_width
      clear_screen
    end
    $stdin.iflush
  end

  def update_window_width
    @window_width = $stdin.winsize[1]
  end

  def single_center_red(message)
    verify_window_and_clear_screen
    puts "\n" * 3
    output_center_red(message)
    puts "\n" * 2
    press_key_to_continue
  end

  def double_center_red(message1, message2)
    clear_screen
    puts "\n" * 2
    output_center_red(message1)
    puts ""
    output_center_red(message2)
    puts "\n" * 1
    press_key_to_continue
    clear_screen
  end
end

class Card
  SUITS = %w(C D H S)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(face)
    @face = face
  end

  def to_s
    face
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = (Card::FACES * 4).shuffle
  end

  def deal_one
    cards.pop
  end
end

class Stats
  attr_accessor :round, :player_score, :dealer_score, :round_winner

  def initialize
    @round = 1
    @player_score = 0
    @dealer_score = 0
  end

  def to_s
    "#{format('ROUND: %2s', round.to_s)}     "\
    "#{format('PLAYER SCORE: %2s', player_score.to_s)}   "\
    "#{format('DEALER SCORE: %2s', dealer_score.to_s)}"
  end
end

module Hand
  def add_card(new_card)
    cards << new_card
  end
end

# noinspection DuplicatedCode
class Participant
  include Hand

  attr_accessor :cards, :turn
  attr_writer :card_total

  def initialize
    @turn = 'player'
    @cards = []
    @card_total = 0
  end

  def card_total
    number_sum = cards.reject { |card| card == 'A' }.map do |card|
      %w(J Q K).include?(card) ? 10 : card.to_i
    end.sum
    add_aces_total(number_sum)
  end

  def add_aces_total(total)
    ace_count = cards.count('A')
    if ace_count.positive?
      (ace_count - 1).times { total += 1 }
      total += total + 11 > 21 ? 1 : 11
    end
    total
  end

  def bust?
    card_total > 21
  end

  def cards_visible
    format(join_visible_cards, card_total.to_s)
  end

  def join_visible_cards
    if cards.size > 2
      "#{"#{cards[0..-2].join(', ')}, and #{cards.last}".ljust(39)}%2s"
    else
      "#{"#{cards.first} and #{cards.last}".ljust(39)}%2s"
    end
  end

  def cards_hidden
    if cards.size > 2
      format("#{cards[0..-2].join(', ')}, and unknown card".ljust(40))
    else
      format("#{cards.first} and unknown card".ljust(40))
    end
  end

  def to_s
    if turn == 'dealer' || instance_of?(Player)
      cards_visible
    else
      cards_hidden
    end
  end
end

class Player < Participant
end

class Dealer < Participant
  attr_accessor :turn

  def initialize
    super
    @turn = false
  end

  def turn?
    turn
  end
end

class TwentyOne
  include Displayable
  include DisplayableUtils

  attr_accessor :deck, :player, :dealer, :stats

  def initialize
    super()
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @stats = Stats.new
  end

  def play
    display_welcome_screen
    display_rules
    loop do
      main_game
      # break unless play_again?
      reset_game
    end
    display_goodbye_screen
  end

  def main_game
    loop do
      deal_cards
      player_turn
      dealer_turn unless player.bust?
      reset_round
      break if winner?
    end
    display_winner_screen
  end

  def dealer_turn
    switch_turn_to_dealer
    display_board(extra_line: true)
    sleep(1)
    while dealer.card_total < 17
      hit('dealer')
    end
    return display_selection("Dealer busted!") if dealer.bust?

    display_selection("Dealer stays!")
  end

  # rubocop:disable Metrics/MethodLength
  def player_turn
    display_board(extra_line: true)
    loop do
      display_choices
      case gets.chomp.downcase
      when 'h', 'hit' then hit('player')
      when 's', 'stay'
        display_selection("Player stays!")
        break
      when 'q', 'quit' then quit
      else invalid_selection
      end
      if player.bust?
        display_selection("Player busts!")
        break
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def switch_turn_to_dealer
    player.turn = 'dealer'
    dealer.turn = 'dealer'
  end

  def hit(person)
    if person == 'player'
      player.add_card(deck.deal_one)
    else
      dealer.add_card(deck.deal_one)
    end
    display_selection("#{person.capitalize} hits!")
  end

  def quit
    display_goodbye_screen
    exit
  end

  def invalid_selection
    display_selection("Invalid selection! Try again...")
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def winner?
    stats.player_score == 5 || stats.dealer_score == 5
  end

  def end_round
    if dealer.bust? || (dealer.card_total < player.card_total && !player.bust?)
      update_score_and_round_winner('Player')
    else
      update_score_and_round_winner('Dealer')
    end
    display_end_round_screen
    stats.round += 1
  end

  def update_score_and_round_winner(person)
    if person == 'Player'
      stats.player_score += 1
    else
      stats.dealer_score += 1
    end
    stats.round_winner = person
  end

  def reset_round
    end_round
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset_game
    initialize
  end
end

TwentyOne.new.play

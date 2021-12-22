require 'pry'
require 'io/console'

class String
  def red_font

  end
end

module Displayable
  private
  # height 10
  # width 50
  @@window_height, @@window_width = STDIN.winsize

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
    IO.console.cursor = [7, @@window_width / 2]
  end

  def reset_cursor
    IO.console.cursor = @cursor_pos
  end

  def press_key_to_continue
    puts ""
    output_center_red("*Press any key to continue*")
    STDIN.getch
  end

  def clear_screen
    system 'clear'
  end

  def verify_window_width
    update_window_width
    until window_width >= 50
      clear_screen
      output_center("Window width too narrow.")
      output_center("Increase by #{50 - window_width} columns to continue.")
      sleep(1)
      update_window_width
    end
    STDIN.iflush
  end

  def update_window_width
    @@window_width = STDIN.winsize[1]
  end

  def window_width
    @@window_width
  end

  def display_red_text(message)
    display_board(extra_line: true)
    output_center_red(message)
    center_cursor
    sleep(1)
    reset_cursor
    display_board(extra_line: true)
    STDIN.iflush
  end

  def display_board(extra_line: false)
    clear_screen
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
    output_center_red("#{stats}")
  end

  def display_welcome_screen
    clear_screen
    puts "\n" * 3
    output_center_red("Welcome to Twenty-One!")
    puts "\n" * 2
    press_key_to_continue
    clear_screen
  end

  def display_rules
    clear_screen
    output_center("These are the rules!")
    press_key_to_continue
  end

  def display_end_round_screen
    clear_screen
    puts "\n" * 3
    output_center_red("#{stats.round_winner} won Round #{stats.round}")
    puts "\n" * 2
    press_key_to_continue
  end

  def display_winner_screen
    if stats.player_score == 5
      message1 = "CONGRATULATIONS"
      message2 = "YOU WON THE GAME!"
    else
      message1 = "BETTER LUCK NEXT TIME"
      message2 = "YOU LOST THE GAME!"
    end
    clear_screen
    puts "\n" * 2
    output_center_red(message1)
    puts ""
    output_center_red(message2)
    puts "\n" * 1
    press_key_to_continue
    clear_screen
  end

  def display_goodbye_screen
    clear_screen
    puts "\n" * 2
    output_center_red("Thanks for playing!")
    puts ""
    output_center_red("Goodbye!")
    puts "\n" * 1
    press_key_to_continue
    clear_screen
  end
end

class Card
  SUITS = %w(C D H S)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    face
  end

  def ace?
    face == 'A'
  end

  def king?
    face == 'K'
  end

  def queen?
    face == 'Q'
  end

  def jack?
    face == 'J'
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

class Participant
  include Hand
  include Displayable

  attr_accessor :cards
  attr_writer :card_total

  def initialize
    @@current_turn = 'player'
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

  def current_turn=(player_or_dealer)
    @@current_turn = player_or_dealer
  end

  def busted?
    card_total > 21
  end

  def cards_visible
    if cards.size > 2
      format("#{"#{cards[0..-2].join(', ')}, and #{cards.last}"
                  .ljust(39)}%2s", card_total.to_s)
    else
      format("#{"#{cards.first} and #{cards.last}"
                  .ljust(39)}%2s", card_total.to_s)
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
    if @@current_turn == 'dealer' || self.class == Player
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

  attr_accessor :deck, :player, :dealer, :stats

  def initialize
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
      break unless play_again?
      reset_game
    end
    display_goodbye_screen
  end

  def main_game
    loop do
      deal_cards
      player_turn
      dealer_turn unless player.busted?
      reset_round
      break if winner?
    end
    display_winner_screen
  end

  def dealer_turn
    dealer.current_turn = "dealer"
    display_board(extra_line: true)
    sleep(1)
    while dealer.card_total < 17
      dealer.add_card(deck.deal_one)
      display_red_text("Dealer hits!")
    end
    if dealer.busted?
      display_red_text("Dealer busted!")
    else
      display_red_text("Dealer stays!")
    end
  end

  def player_turn
    display_board(extra_line: true)
    loop do
      output_center("(H)it, (S)tay, or (Q)uit")
      center_cursor
      case gets.chomp.downcase
      when 'h', 'hit'
        player.add_card(deck.deal_one)
        display_red_text("Player hits!")
      when 's', 'stay'
        display_red_text("Player stays!")
        break
      when 'q', 'quit' then quit
      else invalid_choice
      end
      if player.busted?
        display_red_text("Player busts!")
        break
      end
    end
  end

  def quit
    display_goodbye_screen
    exit
  end

  def invalid_choice
    display_red_text("Invalid choice! Try again...")
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
    if dealer.busted? || dealer.card_total < player.card_total
      stats.player_score += 1
      stats.round_winner = 'Player'
    else
      stats.dealer_score += 1
      stats.round_winner = 'Dealer'
    end
    display_end_round_screen
    stats.round += 1
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
require 'io/console'

module Displayable
  private

  def display_board(extra_line: false)
    verify_window_and_clear_screen
    $stdin.ioflush
    display_stats
    display_turn
    display_hands
    puts "" if extra_line
  end

  def display_choices
    display_board
    puts ""
    print_center("(H)it, (S)tay, or (Q)uit")
    center_cursor
  end

  def display_end_round
    display_board
    name = round_winner == player.name ? player.name : dealer.name
    print_center_red("#{name} WON ROUND #{round}")
    press_key_to_continue
  end

  def display_goodbye_screen
    verify_window_and_clear_screen
    print_double_line("Thanks for playing!", "Goodbye!")
  end

  def display_hands
    print_center("PLAYER HANDS                               TOTALS")
    display_player_hand
    display_dealer_hand
  end

  def display_player_hand
    print_center("#{player.name.ljust(6)}: #{player.cards_visible}")
  end

  def display_dealer_hand
    if turn == 'player'
      print_center("#{dealer.name.ljust(6)}: #{dealer.cards_hidden}")
    else
      print_center("#{dealer.name.ljust(6)}: #{dealer.cards_visible}")
    end
  end

  def display_objective
    verify_window_and_clear_screen
    print_center("-GAME OBJECTIVE-")
    print_center("Twenty-One is a card game consisting of a player")
    print_center("and a dealer, where the participants try to get ")
    print_center("as close to 21 as possible without going over.  ")
    print_center("First to win 5 rounds beats the game!")
    puts ""
    press_key_to_continue
  end

  def display_selection(message)
    display_board
    print_center_red(message)
    center_cursor
    sleep(1)
    display_board
    center_cursor
    sleep(1)
    $stdin.iflush
  end

  def display_stats
    print_center "#{format('ROUND: %2s', round.to_s)}     "\
    "#{format("#{player.name.rjust(6)} SCORE: %2s", player.score.to_s)}   "\
    "#{format("#{dealer.name.rjust(6)} SCORE: %2s", dealer.score.to_s)}"
  end

  def display_turn
    name = @turn == 'player' ? player.name.upcase : 'DEALER'
    print_center_red("#{name}'S TURN")
  end

  def display_welcome_screen
    verify_window_and_clear_screen
    print_double_line("Hello, #{player.name}", "Welcome to Twenty-One!")
    press_key_to_continue
  end

  def display_winner_screen
    verify_window_and_clear_screen
    if player.score == 5
      message1 = "YOU WON THE GAME!"
      message2 = "CONGRATULATIONS"
    else
      message1 = "YOU LOST THE GAME!"
      message2 = "BETTER LUCK NEXT TIME"
    end
    print_double_line(message1, message2)
    press_key_to_continue
  end
end

module DisplayableUtils
  private

  attr_accessor :window_width

  def initialize
    @window_width = $stdin.winsize[1]
  end

  def print_center(message, red_font: false)
    if red_font
      puts "\e[31m#{message.center(window_width)}\e[0m"
    else
      puts message.center(window_width)
    end
  end

  def print_center_red(message)
    print_center(message, red_font: true)
  end

  def print_single_line(message, red: false)
    verify_window_and_clear_screen
    puts "", "", ""
    red == false ? print_center(message) : print_center_red(message)
    puts "", ""
  end

  def print_double_line(message1, message2)
    verify_window_and_clear_screen
    puts ""
    print_center(message1)
    puts ""
    print_center(message2)
    puts "", ""
  end

  def center_cursor
    IO.console.cursor = [7, window_width / 2]
  end

  def name_cursor
    IO.console.cursor = [5, (window_width / 2 - 22)]
  end

  def press_key_to_continue
    print_center("*Press any key to continue*")
    $stdin.getch
    clear_screen
  end

  def clear_screen
    system 'clear'
  end

  def verify_window_and_clear_screen
    clear_screen
    update_window_width
    verify_window_width
  end

  def verify_window_width
    until window_width >= 50
      print_center("Window width too narrow.")
      print_center("Increase by #{50 - window_width} columns to continue.")
      sleep(1)
      update_window_width
      clear_screen
    end
    $stdin.iflush
  end

  def update_window_width
    @window_width = $stdin.winsize[1]
  end
end

class Card
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

class Participant
  attr_accessor :cards, :name, :score
  attr_writer :card_total

  def initialize
    reset_stats
    @score = 0
  end

  def reset_stats
    @cards = []
    @card_total = 0
  end

  def add_card(new_card)
    cards << new_card
  end

  def card_total
    number_sum = cards.reject { |card| card == 'A' }.map do |card|
      %w(J Q K).include?(card) ? 10 : card.to_i
    end.sum
    add_aces_total(number_sum)
  end

  def bust?
    card_total > 21
  end

  def cards_visible
    format(join_visible_cards, card_total.to_s)
  end

  def cards_hidden
    if cards.size > 2
      format("#{cards[0..-2].join(', ')}, and unknown card".ljust(41))
    else
      format("#{cards.first} and unknown card".ljust(41))
    end
  end

  private

  def add_aces_total(total)
    ace_count = cards.count('A')
    if ace_count.positive?
      (ace_count - 1).times { total += 1 }
      total += total + 11 > 21 ? 1 : 11
    end
    total
  end

  def join_visible_cards
    if cards.size > 2
      "#{"#{cards[0..-2].join(', ')}, and #{cards.last}".ljust(39)}%2s"
    else
      "#{"#{cards.first} and #{cards.last}".ljust(39)}%2s"
    end
  end
end

class Player < Participant
end

class Dealer < Participant
  def initialize
    super
    @name = 'DEALER'
  end
end

class TwentyOne
  include Displayable
  include DisplayableUtils

  attr_accessor :deck, :player, :dealer, :stats, :round, :round_winner, :turn

  def initialize
    super
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @round = 1
    @turn = 'player'
  end

  def play
    enter_player_name
    display_welcome_screen
    display_objective
    loop do
      main_game
      break unless play_again?
      reset_game
    end
    display_goodbye_screen
  end

  private

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

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def enter_player_name
    name = ''
    loop do
      verify_window_and_clear_screen
      print_single_line("Enter your name (1-6 alphabetic characters):")
      name_cursor
      name = gets.chomp
      break if name.scan(/[a-z]/i).join == name && name.size.between?(1, 6)
      invalid_name
    end
    player.name = name.upcase
  end

  def invalid_name
    print_single_line("Invalid Name. Please try again!")
    sleep(1)
    $stdin.iflush
  end

  # rubocop:disable Metrics/MethodLength
  def player_turn
    loop do
      display_choices
      case gets.chomp.downcase
      when 'h', 'hit' then hit
      when 's', 'stay'
        display_selection("#{player.name} STAYS!")
        break
      when 'q', 'quit' then quit
      else invalid_selection
      end
      if player.bust?
        display_selection("#{player.name} BUSTS!")
        break
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def dealer_turn
    switch_turn_to_dealer
    display_board(extra_line: true)
    sleep(1.5)
    while dealer.card_total < 17
      hit
    end
    display_selection("#{dealer.name} #{dealer.bust? ? 'BUSTS!' : 'STAYS!'}")
  end

  def hit
    if turn == 'player'
      player.add_card(deck.deal_one)
      display_selection("#{player.name} HITS!")
    else
      dealer.add_card(deck.deal_one)
      display_selection("#{dealer.name} HITS!")
    end
  end

  def invalid_selection
    display_selection("Invalid selection! Try again...")
  end

  def switch_turn_to_dealer
    @turn = 'dealer'
  end

  def end_round
    if dealer.bust? || (dealer.card_total < player.card_total && !player.bust?)
      update_score_and_round_winner(human: true)
    else
      update_score_and_round_winner
    end
    display_end_round
    @round += 1
  end

  def update_score_and_round_winner(human: false)
    if human
      player.score += 1
      @round_winner = player.name
    else
      dealer.score += 1
      @round_winner = dealer.name
    end
  end

  def reset_round
    end_round
    @deck = Deck.new
    @turn = 'player'
    player.reset_stats
    dealer.reset_stats
  end

  def reset_game
    name = player.name
    initialize
    player.name = name
  end

  def play_again?
    loop do
      print_single_line("Would you like to play again? (Y)es or (N)o")
      center_cursor
      case gets.chomp.downcase
      when 'y', 'yes' then return true
      when 'n', 'no' then return false
      end
      print_single_line("Invalid choice! Try again..")
      press_key_to_continue
    end
  end

  def quit
    display_goodbye_screen
    exit
  end

  def winner?
    player.score == 5 || dealer.score == 5
  end
end

TwentyOne.new.play

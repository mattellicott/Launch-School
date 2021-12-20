require 'io/console'
require 'pry'
module Printable
  private

  @@window_width = STDIN.winsize[1]

  def output_center(message)
    if message.class == String
      puts message.center(window_width)
    else
      message.each { |line| puts line.center(window_width) }
    end
  end

  def press_key_to_continue
    puts ""
    output_center("*Press any key to continue*")
    STDIN.getch
  end

  def verify_window_width
    update_window_width
    until window_width >= 60
      system("clear")
      output_center("Window width too narrow.")
      output_center("Increase by #{60 - window_width} columns to continue.")
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
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  SQUARES = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  include Printable

  attr_reader :computer_squares

  def initialize
    @squares = {}
    @computer_squares = []
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def computer_squares
    @computer_squares = SQUARES.select do |n|
      @squares[n].marker == TTTGame::COMPUTER_MARKER
    end
  end

  def reset
    SQUARES.each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/MethodLength
  def draw
    current_board = ["     |     |     ",
                     "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ",
                     "     |     |     ",
                     "-----+-----+-----",
                     "     |     |     ",
                     "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ",
                     "     |     |     ",
                     "-----+-----+-----",
                     "     |     |     ",
                     "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ",
                     "     |     |     "]
    output_center(current_board)
  end
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  include Printable

  attr_reader :board, :human, :computer
  attr_accessor :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    reset_score
  end

  def reset_score
    @score = { human: 0, computer: 0, tie: 0 }
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      game_round
      display_game_result
      break unless play_again?
      reset_score
      display_play_again_message
    end
  end

  def game_round
    loop do
      clear_screen_and_display_board
      player_move
      round_over
      reset
      break if game_winner?
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def game_winner?
    score[:human] == 5 || score[:computer] == 5
  end

  def update_score
    @score[round_winner] += 1
  end

  def round_winner
    case board.winning_marker
    when human.marker then :human
    when computer.marker then :computer
    else :tie
    end
  end

  def round_over
    display_round_result
    update_score
    press_key_to_continue
  end

  def display_welcome_message
    output_center("Welcome to Tic Tac Toe!")
    puts ""
  end

  def display_goodbye_message
    output_center("Thanks for playing Tic Tac Toe! Goodbye!")
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_score
    output_center("SCORE")
    output_center("You: #{score[:human]}  " \
                            "Computer: #{score[:computer]}  " \
                            "Ties: #{score[:tie]}")
    puts ""
  end

  def display_board
    display_score
    output_center("You're a #{human.marker}. Computer is a #{computer.marker}.")
    puts ""
    board.draw
    puts ""
  end

  def display_available_squares
    output_center("Choose a square (#{available_squares}): ")
  end

  def available_squares
    case board.unmarked_keys.size
    when 1 then board.unmarked_keys.first
    when 2 then board.unmarked_keys.join(' or ')
    else
      "#{board.unmarked_keys[0..-2].join(', ')}, or #{board.unmarked_keys.last}"
    end
  end

  def human_moves
    display_available_squares
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      clear_screen_and_display_board
      display_available_squares
      output_center("Sorry, that's not a valid choice.")
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def computer_
    board.computer_squares
    WINNING_LINES.each do |line|
      line_choices = (line - board.computer_squares)
      return line_choices.first if line_choices.size == 1
    end
    nil
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_round_result
    clear_screen_and_display_board
    case round_winner
    when :human then output_center("You won this round!")
    when :computer then output_center("Computer won this round!")
    else output_center("This round was a tie!")
    end
  end

  def display_game_result
    clear_screen
    display_score
    winner = score[:human] == 5 ? 'You' : 'Computer'
    output_center("#{winner} won the game!")
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      output_center("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      clear_screen
      output_center("Sorry, must be y or n")
    end

    answer == 'y'
  end

  def clear_screen
    verify_window_width
    system("clear")
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear_screen
  end

  def display_play_again_message
    clear_screen
    output_center("Let's play again!")
    press_key_to_continue
  end
end

game = TTTGame.new
game.play

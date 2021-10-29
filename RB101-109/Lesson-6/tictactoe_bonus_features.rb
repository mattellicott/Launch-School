require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts <<~BOARD
  You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.
       |     |
    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
       |     |
  -----+-----+-----
       |     |
    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
       |     |
  -----+-----+-----
       |     |
    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
       |     |
  BOARD
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  display_board(new_board)
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def who_goes_first?
  result = ['Player', 'Computer'].sample
  prompt("#{result} goes first! Press Enter to continue.")
  gets
  result
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

# rubocop:disable Metrics/CyclomaticComplexity
def computer_places_piece!(brd)
  square = nil

  # OFFENSE
  WINNING_LINES.each do |line|
    square = find_best_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # DEFENSE
  if !square
    WINNING_LINES.each do |line|
      square = find_best_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # PICK MIDDLE SQUARE, RANDOM IF MIDDLE SQUARE TAKEN
  if !square
    square = empty_squares(brd).include?(5) ? 5 : empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/CyclomaticComplexity

def find_best_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2 &&
     brd.values_at(*line).count(INITIAL_MARKER) == 1
    line[brd.fetch_values(*line).index(INITIAL_MARKER)]
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array)
  return "#{array[0..-2].join(', ')}, or #{array[-1]}" if array.size > 1
  array[0]
end

def tally_score!(score, brd)
  score[detect_winner(brd)] += 1 unless !detect_winner(brd)
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

# MAIN LOOP
loop do
  score = { 'Player' => 0, 'Computer' => 0 }
  loop do
    board = initialize_board
    current_player = who_goes_first?

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won this round!")
    else
      prompt("This round is a tie!")
    end
    prompt("Press Enter to continue.")
    gets
    tally_score!(score, board)
    break if score['Player'] == 5 || score['Computer'] == 5
  end

  prompt("#{score.key(5)} is the Grand Winner!")
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Good bye!")

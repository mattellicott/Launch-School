require 'yaml'

FILE_DATA = YAML.load_file("4x4_tictactoe.yml")
BOARD = FILE_DATA[:board]
File.new('4x4_history.yml', 'w+') unless File.exist?('4x4_history.yml')
score_data = YAML.load_file("4x4_history.yml")
score_data ||= []

def prompt(data, brd, no_choices = nil)
  response = ''
  display_board(brd)
  loop do
    message(data[:message])
    center_cursor
    response = gets.chomp.upcase
    return response if no_choices && response != ''
    return response if !no_choices && data[:choices].include?(response)
    case response
    when 'RULES' then display_rules(brd)
    when 'LAYOUT' then display_board(brd, 0)
    else
      invalid_choice(brd)
    end
  end
end

def message(string, new_lines = 1)
  puts "#{"\n" * new_lines}#{string.center(71)}"
end

def enter_to_continue
  message(FILE_DATA[:continue])
  center_cursor
  gets
end

def invalid_choice(brd)
  display_board(brd)
  message(FILE_DATA[:invalid])
end

def center_cursor
  print ' ' * 34
end

def joinor(squares)
  return "#{squares[0..-2].join(', ')}, or #{squares[-1]}" if squares.size > 1
  squares[0]
end

def initialize_board
  new_board = {}
  ('1'..'8').each { |num| new_board[num] = INITIAL_MARKER }
  ('A'..'H').each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_board(brd, layout = nil)
  system 'clear'
  board = FILE_DATA[:board].dup
  brd.each { |k, v| board.gsub!(k, v) } unless layout
  puts board
  message("#{PLAYER_NAME}: #{PLAYER_MARKER}    COMPUTER: #{COMPUTER_MARKER}", 0)
  if layout
    message(FILE_DATA[:layout])
    enter_to_continue
    display_board(brd)
  end
end

def display_score_history(score_data)
  system 'clear'
  message('SCORE HISTORY', 0)
  score_data.each { |v| message(v) }
  enter_to_continue
end

def display_rules(brd)
  system 'clear'
  puts FILE_DATA[:rules]
  enter_to_continue
  display_board(brd)
end

def display_score(brd, score)
  display_board(brd)
  message("ROUND OVER")
  message("Current score is:", 0)
  message("#{PLAYER_NAME}: #{format('%-5d', score['Player'])}"\
          "COMPUTER: #{score['Computer']}", 0)
  enter_to_continue
end

def display_winner(brd, score)
  display_board(brd)
  if score['Player'] > score['Computer']
    message("CONGRATULATIONS!")
    message("YOU ARE THE WINNER!", 0)
  elsif score['Player'] < score['Computer']
    message("YOU LOST!")
    message("BETTER LUCK NEXT TIME!", 0)
  else
    message("YOU TIED!")
    message("SOOOO CLOSE...", 0)
  end
  enter_to_continue
end

def who_goes_first?(brd)
  result = ['Player', 'Computer'].sample
  display_board(brd)
  message("#{result} goes first!")
  enter_to_continue
  result
end

def place_piece!(board, current_player, difficulty)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board, difficulty)
  end
end

def player_places_piece!(brd)
  choice_hash = { message: "Choose a square (#{joinor(empty_squares(brd))}):",
                  choices: empty_squares(brd) }

  brd[prompt(choice_hash, brd)] = PLAYER_MARKER
end

# rubocop:disable Metrics
def computer_places_piece!(brd, difficulty)
  # Offense when COMPUTER needs 1 to complete a line set
  square = find_best_square(brd, COMPUTER_MARKER, 1)
  # Defense when PLAYER needs 1 to complete a line set and NORMAL/HARD
  square = find_best_square(brd, PLAYER_MARKER, 1) if !square &&
                                                      difficulty > 0
  # Offense when COMPUTER needs 1 to complete a corner set
  square = find_best_corner_square(brd, COMPUTER_MARKER) if !square
  # Defense when PLAYER needs 1 to complete a corner set and HARD
  square = find_best_corner_square(brd, PLAYER_MARKER) if !square &&
                                                          difficulty > 1
  # Offense when COMPUTER needs 2 to complete a line set
  square = find_best_square(brd, COMPUTER_MARKER, 2) if !square
  # Offense when COMPUTER needs 3 to complete a line set
  square = find_best_square(brd, COMPUTER_MARKER, 3) if !square
  # Offense when COMPUTER needs 3 to complete a line set
  square = find_best_square(brd, COMPUTER_MARKER, 4) if !square
  # PICK RANDOMLY IF THERE IS NO BETTER OPTION
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics

def find_best_square(brd, marker, squares_needed)
  FILE_DATA[:lines].each do |line|
    if brd.values_at(*line).count(marker) == (4 - squares_needed) &&
       brd.values_at(*line).count(INITIAL_MARKER) == squares_needed
      return line[brd.fetch_values(*line).index(INITIAL_MARKER)]
    end
  end
  nil
end

def find_best_corner_square(brd, marker)
  if brd.values_at(*FILE_DATA[:corners]).count(marker) == 3 &&
     brd.values_at(*FILE_DATA[:corners]).count(INITIAL_MARKER) == 1
    brd.each do |k, v|
      return k if v == INITIAL_MARKER && FILE_DATA[:corners].include?(k)
    end
  end
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# rubocop:disable Metrics
def no_more_points_possible?(brd)
  FILE_DATA[:lines].each do |line|
    if (brd.values_at(*line).count(PLAYER_MARKER) == 4) ||
       (brd.values_at(*line).count(COMPUTER_MARKER) == 4)
      next
    end
    if (brd.values_at(*line).count(PLAYER_MARKER) +
        brd.values_at(*line).count(INITIAL_MARKER) == 4) ||
       (brd.values_at(*line).count(COMPUTER_MARKER) +
        brd.values_at(*line).count(INITIAL_MARKER) == 4)
      return false
    end
  end
  true
end
# rubocop:enable Metrics

def get_difficulty(brd)
  case prompt(FILE_DATA[:difficulty], brd)
  when 'E', 'EASY' then 0
  when 'N', 'NORMAL' then 1
  when 'H', 'HARD' then 2
  end
end

# rubocop:disable Metrics
def update_score!(brd, score)
  FILE_DATA[:lines].each do |line|
    score['Player'] += 2 if brd.values_at(*line).count(PLAYER_MARKER) == 4
    score['Computer'] += 2 if brd.values_at(*line).count(COMPUTER_MARKER) == 4
  end
  if brd.values_at(*FILE_DATA[:corners]).count(PLAYER_MARKER) == 4
    score['Player'] += 1
  elsif brd.values_at(*FILE_DATA[:corners]).count(COMPUTER_MARKER) == 4
    score['Computer'] += 1
  end
end
# rubocop:enable Metrics

def update_score_history(data, score)
  data += ["#{format('%-9s', "#{PLAYER_NAME}:")} "\
           "#{format('%2d', score['Player'])} "\
           "#{format('%-9s', 'COMPUTER:')} "\
           "#{format('%2d', score['Computer'])} "]
  File.open("4x4_history.yml", 'w') { |f| YAML.dump(data, f) }
  data
end

def play_again?(brd)
  response = prompt(FILE_DATA[:play_again], brd)
  response == 'Y' || response == 'YES'
end

# Initial startup
loop do
  # rubocop:disable Lint
  PLAYER_NAME = 'Player'
  INITIAL_MARKER = ' '
  PLAYER_MARKER = ' '
  COMPUTER_MARKER = ' '
  board = initialize_board

  display_score_history(score_data) unless score_data.empty?
  display_rules(board)
  display_board(board, 'layout')

  PLAYER_NAME = prompt(FILE_DATA[:name], board, true)[0..7]
  PLAYER_MARKER = prompt(FILE_DATA[:markers], board)
  COMPUTER_MARKER = (['X', 'O'] - [PLAYER_MARKER])[0]
  # rubocop:enable Lint

  difficulty = get_difficulty(board)
  start_player = who_goes_first?(board)
  score = { 'Player' => 0, 'Computer' => 0 }

  loop do
    current_player = start_player

    loop do
      display_board(board)
      place_piece!(board, current_player, difficulty)
      current_player = alternate_player(current_player)
      break if board_full?(board) || no_more_points_possible?(board)
    end

    update_score!(board, score)
    display_score(board, score)
    break if score.any? { |_, v| v >= 10 }

    start_player = alternate_player(start_player)
    board = initialize_board
  end

  board = initialize_board
  display_winner(board, score)
  score_data = update_score_history(score_data, score)

  break unless play_again?(board)
end

class Game
attr_reader:player_board,:cpu_board
  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
  end
def welcome
  puts "Welcome to BATTLESHIP
Enter p to play. Enter q to quit."
  player_input = gets.chomp.downcase

    until (player_input.include?("p") ||
          player_input.include?("q"))
    puts "Invalid response. Try again."
    player_input = gets.chomp.downcase
  end
  if player_input == "p"
    setup_game
  else
    game_over
    exit
    end
  end

#   def setup_game
#     @player_board.populate_board
#     @cpu_board.populate_board
#
#
#   end
# end

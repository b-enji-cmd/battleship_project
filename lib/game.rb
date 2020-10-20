require './lib/board'
require './lib/cell'
require './lib/ship'
class Game
attr_reader:player_board,:cpu_board
  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
def start
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
    end
  end

  def cpu_random_coordinate

    random_letters =["A", "B", "C", "D"].shuffle
    random_coordinate = (random_letters[rand(0..3)]) + (rand(1..4).to_s)

  end

  def game_over
    exit
  end

  def setup_game
    @player_board.populate_board
    @cpu_board.populate_board
    cruiser_coordinates = ["#{cpu_random_coordinate}" ,"#{cpu_random_coordinate}","#{cpu_random_coordinate}" ]

    until @cpu_board.valid_placement?(@cruiser, cruiser_coordinates) && cruiser_coordinates.uniq.count != 1
        cruiser_coordinates = ["#{cpu_random_coordinate}" ,"#{cpu_random_coordinate}","#{cpu_random_coordinate}" ]
    end
     @cpu_board.place(@cruiser, cruiser_coordinates)


     submarine_coordinates = ["#{cpu_random_coordinate}" ,"#{cpu_random_coordinate}"]
     until @cpu_board.valid_placement?(@submarine, submarine_coordinates) && submarine_coordinates.uniq.count != 1
         submarine_coordinates = ["#{cpu_random_coordinate}" ,"#{cpu_random_coordinate}"]
     end
      @cpu_board.place(@submarine, submarine_coordinates)
  end
  def user_setup
    puts "I have laid out my ships on the grid\nYou now need to lay out your two ships\nThe cruiser is three units long, the submarine is two\n"
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces)"
    player_cruiser_coordinates = gets.chomp.to_s.upcase.split(" ")
    until @player_board.valid_placement?(@cruiser,player_cruiser_coordinates)
      puts "Invalid placement"
       player_cruiser_coordinates = gets.chomp.to_s.upcase.split(" ")
     end
     @player_board.place(@cruiser,player_cruiser_coordinates)
    puts @player_board.render(true)
    puts "Place your sub (2 spaces)"
    player_submarine_coordinates = gets.chomp.to_s.upcase.split(" ")
    until @player_board.valid_placement?(@submarine,player_submarine_coordinates)
      puts "Invalid placement"
       player_submarine_coordinates = gets.chomp.to_s.upcase.split(" ")
     end
     @player_board.place(@submarine,player_submarine_coordinates)
     puts @player_board.render(true)
     puts @cpu_board.render(true)
  end

  def player_shoot
     
  end
end#of class

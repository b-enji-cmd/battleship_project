require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require 'minitest/autorun'

class GameTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @game = Game.new

  end
  def test_it_can_start_game
    @game.start
    binding.pry
  end
end

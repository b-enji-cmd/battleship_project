require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'minitest/autorun'

class BoardTest < Minitest::Test

  def setup
  @board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)    
  end

  def test_it_exists
    #test_hash = {}
    assert_instance_of Board, @board

    #assert_equal test_hash, @board.cells
  end

  def test_it_can_populate_board
    @board.populate_board
    assert_equal 16,@board.cells.keys.count

  end

  def test_it_can_validate_cordinates
    @board.populate_board
    assert @board.valid_coordinate?("A1")
    refute @board.valid_coordinate?("A22")
  end

  def test_it_can_validate_placement
    #binding.pry
    assert_equal false , @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false , @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false , @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false , @board.valid_placement?(@cruiser, ["A1", "C1", "D1"])
    assert_equal true , @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

end

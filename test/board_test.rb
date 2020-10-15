require 'pry'
require './lib/board'
require './lib/cell'
require 'minitest/autorun'

class BoardTest < Minitest::Test

  def setup
  @board = Board.new
  end

  def test_it_exists
    test_hash = {}
    assert_instance_of Board, @board

    assert_equal test_hash, @board.cells
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

  def test_

end

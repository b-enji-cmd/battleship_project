require './lib/ship'
require './lib/cell'
require 'pry'
require 'minitest/autorun'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end
  def test_it_exists

    assert_instance_of Cell, @cell
  end
  def test_it_can_return_empty_state
    assert_equal true, @cell.empty?
  end
  def test_if_ship_is_placed
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end
  def test_if_fired_upon_returns_state
    assert_equal false, @cell.fired_upon?
  end

  def test_fire_upon_changes_state
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end
end

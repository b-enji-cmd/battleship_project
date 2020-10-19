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

  def test_if_cell_can_render
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
    end

    def test_it_can_render_S
      cell_2 = Cell.new("C3")
      cell_2.place_ship(@cruiser)
       #binding.pry
      assert_equal "S",cell_2.render(true)
    end

    def test_it_can_hit_and_miss

      cell_2 = Cell.new("C3")
      cell_2.fire_upon
      assert_equal "M", cell_2.render
      cell_2.place_ship(@cruiser)
      cell_2.fire_upon
      assert_equal "H",cell_2.render
    end

    def test_ship_sinks
      cell_2 = Cell.new("C3")
      cell_2.place_ship(@cruiser)
      cell_2.fire_upon
      @cruiser.hit
      @cruiser.hit
      #binding.pry
      @cruiser.hit
      #binding.pry
      assert_equal "X", cell_2.render
    end
    

   
end

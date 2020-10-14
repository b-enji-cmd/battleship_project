require './lib/ship'
require 'pry'
require 'minitest/autorun'
class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end
  def test_it_exists
    assert_instance_of Ship, @cruiser
  end
  def test_it_returns_sunk_state
    @cruiser = Ship.new("Cruiser", 0)
    assert_equal true, @cruiser.sunk?
  end
  def test_if_hit_subtracts_1
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end
end

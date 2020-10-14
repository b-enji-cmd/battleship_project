class Cell
  attr_reader :coordinate, :ship, :taken_fire
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @taken_fire = false
  end

  def empty?
    if @ship == nil
      true
    else false
    end
  end

  def place_ship(placed_ship)
    @ship = placed_ship
  end

  def fired_upon?
     @taken_fire
  end
  def fire_upon
    @taken_fire = true
  end
end

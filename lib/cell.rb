
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

  def render(show_ship = false)

    if show_ship == true && empty? == false
      "S"
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && @ship.sunk? == true
      "X"
    else show_ship == false && empty? == false
      render_logic
    end
  end
  def render_logic
    if fired_upon? == true && empty? == false
      "H"
    else fired_upon? == false
      "."
    end
  end
end

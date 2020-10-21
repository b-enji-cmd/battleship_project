
class Cell
  attr_reader :coordinate, :ship, :taken_fire
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @taken_fire = false
  end

  def empty?
    @ship == nil
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

  def render(show_ship = nil)
      if !fired_upon?
        if show_ship == true && !empty?
            "S"
        else
            "."
        end#of inner if
      elsif empty?
        "M"
      elsif !empty? && !@ship.sunk?
        "H"
      else
        "X"
      end
    end

# . < M || S < H < X
end

  # def render_logic
  #   .
  #  !show_ship &&fired upon && empty?
  #       s
  #   fired upon && empty?
  #
  #  m
  #        fired_upon && !sunk
  #           h
  #               sunk
  #                      x


  #   end

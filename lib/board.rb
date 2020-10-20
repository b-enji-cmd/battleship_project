require './lib/cell'
class Board
  attr_reader:cells
  def initialize
    @cells = {}
  end
  def populate_board
    coordinate_array = %w(A1 A2 A3 A4
                          B1 B2 B3 B4
                          C1 C2 C3 C4
                          D1 D2 D3 D4)
    coordinate_array.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
  end
  def valid_coordinate?(coord)
     @cells.include?(coord)
  end

  def valid_length?(ship_object, given_coordinate_arr)
    ship_object.length == given_coordinate_arr.count
  end

  def valid_consecutive_numbers?(ship_object, given_coordinate_arr)
    only_numbers = given_coordinate_arr.map do |coord|
          coord.chars
    end

    valid_numbers = only_numbers.map do |nested_arr|
        nested_arr[1].to_i
    end

    if valid_numbers.uniq.count == 1
        return true
    else

      valid_numbers.each_cons(2).all? {|a , b| b == a+1}

    end

  end

  def valid_consecutive_letters?(ship_object, given_coordinate_arr)
    arg_letters =  given_coordinate_arr.map do |coord|
         coord.chars
    end
    arg_letters
    valid_letters = arg_letters.map do |nested|
      nested[0]
    end
    if valid_letters.uniq.count == 1
      return true
    else

     valid_ordinal = valid_letters.map do |letter|
          letter.ord
     end

      valid_ordinal.each_cons(2).all? {|a , b| b == a+1}
    end
  end

  def valid_consecutive?(ship_object, given_coordinate_arr)
    valid_consecutive_numbers?(ship_object, given_coordinate_arr) && valid_consecutive_letters?(ship_object, given_coordinate_arr)
  end
  def overlap?(given_coordinate_arr)

      #given_coordinate_arr.any? {|coordinate| @cells[coordinate].ship == nil}
        given_coordinate_arr.map do |coord|
          @cells.fetch(coord).ship == nil
        end[0]

  end
  def valid_placement?(ship_object, given_coordinate_arr)
    valid_length?(ship_object, given_coordinate_arr) &&
    valid_consecutive?(ship_object, given_coordinate_arr)&&
    !valid_diagonal?(ship_object, given_coordinate_arr) &&
    overlap?(given_coordinate_arr)

  end

  def valid_diagonal?(ship_object, given_coordinate_arr)
    arg_letter = []
    arg_num = []
    given_coordinate_arr.each do |coord|
        coord
        arg_letter << coord[0]
        arg_num << coord[1].to_i
    end
    (arg_letter.uniq.count> 1 ) && (arg_num.uniq.count> 1 )
  end

  def place(ship, coordinates)
     coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(show_ship = false)
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(show_ship)} #{@cells["A2"].render(show_ship)} #{@cells["A3"].render(show_ship)} #{@cells["A4"].render(show_ship)} \n" +
      "B #{@cells["B1"].render(show_ship)} #{@cells["B2"].render(show_ship)} #{@cells["B3"].render(show_ship)} #{@cells["B4"].render(show_ship)} \n" +
      "C #{@cells["C1"].render(show_ship)} #{@cells["C2"].render(show_ship)} #{@cells["C3"].render(show_ship)} #{@cells["C4"].render(show_ship)} \n" +
      "D #{@cells["D1"].render(show_ship)} #{@cells["D2"].render(show_ship)} #{@cells["D3"].render(show_ship)} #{@cells["D4"].render(show_ship)} \n"

  end
end

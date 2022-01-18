require './seat_group'
class Plane
  attr_reader :seat_groups

  def initialize
    @seat_groups = []
  end

  def add_seat_group(columns, rows)
    @seat_groups << SeatGroup.new(rows, columns)
  end

  def get_number_of_seat_groups
    SeatGroup.number_of_seat_groups
  end
end
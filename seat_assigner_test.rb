require 'test/unit'
require './seat_group'
require './plane'
require './seat_assigner'
# to run unit test, run the command: irb <unit test name here>.rb

class SeatAssignerTest < Test::Unit::TestCase
  def setup
  end

  # test assigning of passenger to aisle seats

  def test_assign_to_aisle_seats_with_five_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)

    number_of_passengers = 5
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, number_of_passengers + 1
    first_seat_group = ['X', 'X', 1], 
                       ['X', 'X', 'X'],
                       ['X', 'X', 'X']
    second_seat_group = [2, 'X', 3], 
                        ['X', 'X', 'X'],
                        ['X', 'X', 'X']
    third_seat_group = [4, 'X', 5], 
                       ['X', 'X', 'X'],
                       ['X', 'X', 'X']
    fourth_seat_group = ['X', 'X', 'X'], 
                        ['X', 'X', 'X'],
                        ['X', 'X', 'X']
    fifth_seat_group = ['X', 'X', 'X'], 
                        ['X', 'X', 'X'],
                        ['X', 'X', 'X']
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  def test_assign_to_aisle_seats_with_fifteen_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)

    number_of_passengers = 15
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, number_of_passengers + 1
    first_seat_group = ['X', 'X', 1], 
                       ['X', 'X', 9],
                       ['X', 'X', 'X']
    second_seat_group = [2, 'X', 3], 
                        [10, 'X', 11],
                        ['X', 'X', 'X']
    third_seat_group = [4, 'X', 5], 
                       [12, 'X', 13],
                       ['X', 'X', 'X']
    fourth_seat_group = [6, 'X', 7], 
                        [14, 'X', 15],
                        ['X', 'X', 'X']
    fifth_seat_group = [8, 'X', 'X'], 
                        ['X', 'X', 'X'],
                        ['X', 'X', 'X']
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  def test_assign_to_aisle_seats_with_full_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)

    number_of_passengers = 25
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, number_of_passengers
    first_seat_group = ['X', 'X', 1], 
                       ['X', 'X', 9],
                       ['X', 'X', 17]
    second_seat_group = [2, 'X', 3], 
                        [10, 'X', 11],
                        [18, 'X', 19]
    third_seat_group = [4, 'X', 5], 
                       [12, 'X', 13],
                       [20, 'X', 21]
    fourth_seat_group = [6, 'X', 7], 
                        [14, 'X', 15],
                        [22, 'X', 23]
    fifth_seat_group = [8, 'X', 'X'], 
                        [16, 'X', 'X'],
                        [24, 'X', 'X']
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  # test assigning of passenger to window seats

  def test_assign_to_window_seats_with_full_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)
    plane.add_seat_group(3, 3)

    number_of_passengers = 31
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, 25
    
    current_passenger_number = SeatAssigner.assign_to_window_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, number_of_passengers

    first_seat_group = [25, 'X', 1], 
                       [27, 'X', 9],
                       [29, 'X', 17]
    second_seat_group = [2, 'X', 3], 
                        [10, 'X', 11],
                        [18, 'X', 19]
    third_seat_group = [4, 'X', 5], 
                       [12, 'X', 13],
                       [20, 'X', 21]
    fourth_seat_group = [6, 'X', 7], 
                        [14, 'X', 15],
                        [22, 'X', 23]
    fifth_seat_group = [8, 'X', 26], 
                        [16, 'X', 28],
                        [24, 'X', 30]
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  # test assigning of passenger to center seats

  def test_assign_to_center_seats_with_half_full_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)

    number_of_passengers = 60
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, 25
    
    current_passenger_number = SeatAssigner.assign_to_window_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, 31
    
    SeatAssigner.assign_to_center_seats(plane.seat_groups, current_passenger_number, number_of_passengers)

    first_seat_group = [25, 31, 32, 33, 1], 
                       [27, 46, 47, 48, 9],
                       [29, 'X', 'X', 'X', 17]
    second_seat_group = [2, 34, 35, 36, 3], 
                        [10, 49, 50, 51, 11],
                        [18, 'X', 'X', 'X', 19]
    third_seat_group = [4, 37, 38, 39, 5], 
                       [12, 52, 53, 54, 13],
                       [20, 'X', 'X', 'X', 21]
    fourth_seat_group = [6, 40, 41, 42, 7], 
                        [14, 55, 56, 57, 15],
                        [22, 'X', 'X', 'X', 23]
    fifth_seat_group = [8, 43, 44, 45, 26], 
                        [16, 58, 59, 60, 28],
                        [24, 'X', 'X', 'X', 30]
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  def test_assign_to_center_seats_with_full_passengers
    SeatGroup.reset_number_of_seat_groups
    plane = Plane.new
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)
    plane.add_seat_group(5, 3)

    number_of_passengers = 75
    current_passenger_number = 1
    current_passenger_number = SeatAssigner.assign_to_aisle_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, 25
    
    current_passenger_number = SeatAssigner.assign_to_window_seats(plane.seat_groups, current_passenger_number, number_of_passengers)
    assert_equal current_passenger_number, 31
    
    SeatAssigner.assign_to_center_seats(plane.seat_groups, current_passenger_number, number_of_passengers)

    first_seat_group = [25, 31, 32, 33, 1], 
                       [27, 46, 47, 48, 9],
                       [29, 61, 62, 63, 17]
    second_seat_group = [2, 34, 35, 36, 3], 
                        [10, 49, 50, 51, 11],
                        [18, 64, 65, 66, 19]
    third_seat_group = [4, 37, 38, 39, 5], 
                       [12, 52, 53, 54, 13],
                       [20, 67, 68, 69, 21]
    fourth_seat_group = [6, 40, 41, 42, 7], 
                        [14, 55, 56, 57, 15],
                        [22, 70, 71, 72, 23]
    fifth_seat_group = [8, 43, 44, 45, 26], 
                        [16, 58, 59, 60, 28],
                        [24, 73, 74, 75, 30]
    
    assert_seat_ordering_is_same([first_seat_group, second_seat_group, third_seat_group, fourth_seat_group, fifth_seat_group], plane.seat_groups)
  end

  private

  def assert_seat_ordering_is_same(expected, seat_groups)
    actual = seat_groups.each_with_object([]) do |seat_group, result|
      result << seat_group.seats
    end
    assert_equal expected, actual
  end

end
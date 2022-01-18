require 'test/unit'
require './seat_group'
# to run unit test, run the command: irb <unit test name here>.rb

class SeatGroupAssignPassengerTest < Test::Unit::TestCase
  def setup
  end

  # Left window group seat tests

  def test_left_window_group_seat_with_one_column
    SeatGroup.reset_number_of_seat_groups
    left_window_group_seat = SeatGroup.new(5, 1)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[1], [2], [3], [4], [5]]
    assert_equal left_window_group_seat.seats, left_window_group_seat.seats
  end

  def test_left_window_group_seat_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    left_window_group_seat = SeatGroup.new(5, 2)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[6, 1], [7, 2], [8, 3], ["X", 4], ["X", 5]]
    assert_equal left_window_group_seat.seats, left_window_group_seat.seats
  end

  def test_left_window_group_seat_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    left_window_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[6, "X", 1], [7, "X", 2], [8, "X", 3], ["X", "X", 4], ["X", "X", 5]]
    assert_equal left_window_group_seat.seats, left_window_group_seat.seats
  end

  def test_left_window_group_seat_with_four_columns
    SeatGroup.reset_number_of_seat_groups
    left_window_group_seat = SeatGroup.new(5, 4)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[6, "X", "X", 1], [7, "X", "X", 2], [8, "X", "X", 3], ["X", "X", "X", 4], ["X", "X", "X", 5]]
    assert_equal left_window_group_seat.seats, left_window_group_seat.seats
  end

  def test_left_window_group_seat_with_five_columns
    SeatGroup.reset_number_of_seat_groups
    left_window_group_seat = SeatGroup.new(5, 5)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[6, "X", "X", "X", 1], [7, "X", "X", "X", 2], [8, "X", "X", "X", 3], ["X", "X", "X", "X", 4], ["X", "X", "X", "X", 5]]
    assert_equal left_window_group_seat.seats, left_window_group_seat.seats
  end

  # Right window group seat tests

  def test_right_window_group_seat_with_one_column
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    right_window_group_seat = SeatGroup.new(5, 1)
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[1], [2], [3], [4], [5]]
    assert_equal right_window_group_seat.seats, right_window_group_seat.seats
  end

  def test_right_window_group_seat_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    right_window_group_seat = SeatGroup.new(5, 2)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[1, 6], [2, 7], [3, 8], [4, "X"], [5, "X"]]
    assert_equal right_window_group_seat.seats, right_window_group_seat.seats
  end

  def test_right_window_group_seat_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, "X", 6], [2, "X", 7], [3, "X", 8], [4, "X", "X"], [5, "X", "X"]]
    assert_equal right_window_group_seat.seats, right_window_group_seat.seats
  end

  def test_right_window_group_seat_with_four_columns
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 4)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, "X", "X", 6], [2, "X", "X", 7], [3, "X", "X", 8], [4, "X", "X", "X"], [5, "X", "X", "X"]]
    assert_equal right_window_group_seat.seats, right_window_group_seat.seats
  end

  def test_right_window_group_seat_with_five_columns
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 5)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, "X", "X", "X", 6], [2, "X", "X", "X", 7], [3, "X", "X", "X", 8], [4, "X", "X", "X", "X"], [5, "X", "X", "X", "X"]]
    assert_equal right_window_group_seat.seats, right_window_group_seat.seats
  end

  # Center group seat tests

  def test_center_group_seat_with_one_column
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 1)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[1], [2], [3], [4], [5]]
    assert_equal center_group_seat.seats, center_group_seat.seats
  end

  def test_center_group_seat_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 2)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..8]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
    end

    expected_seat_order = [[1, 6], [2, 7], [3, 8], [4, "X"], [5, "X"]]
    assert_equal center_group_seat.seats, center_group_seat.seats
  end

  def test_center_group_seat_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..12]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, 11, 6], [2, 12, 7], [3, "X", 8], [4, "X", 9], [5, "X", 10]]
    assert_equal center_group_seat.seats, center_group_seat.seats
  end

  def test_center_group_seat_with_four_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 4)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..15]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, 11, 12, 6], [2, 13, 14, 7], [3, 15, "X", 8], [4, "X", "X", 9], [5, "X", "X", 10]]
    assert_equal center_group_seat.seats, center_group_seat.seats
  end

  def test_center_group_seat_with_five_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 5)
    SeatGroup.new(3, 3)
    passenger_numbers = [*1..17]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
    end
    
    expected_seat_order = [[1, 11, 12, 13, 6], [2, 14, 15, 16, 7], [3, 17, "X", "X", 8], [4, "X", "X", "X", 9], [5, "X", "X", "X", 10]]
    assert_equal center_group_seat.seats, center_group_seat.seats
  end
end
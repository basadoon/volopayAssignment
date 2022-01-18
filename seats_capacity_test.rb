require 'test/unit'
require './seat_group'
# to run unit test, run the command: irb <unit test name here>.rb

class SeatsCapacityTest < Test::Unit::TestCase
  def setup
  end

  # Aisle seats capacity tests

  def test_aisle_capacity_with_one_column
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 1)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_aisle_seats_occupied, false
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 5
        assert_equal center_group_seat.are_aisle_seats_occupied, false
      else
        assert_equal center_group_seat.are_aisle_seats_occupied, true
      end
    end
  end

  def test_aisle_capacity_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 2)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_aisle_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal center_group_seat.are_aisle_seats_occupied, false
      else
        assert_equal center_group_seat.are_aisle_seats_occupied, true
      end
    end
  end

  def test_aisle_capacity_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_aisle_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal center_group_seat.are_aisle_seats_occupied, false
      else
        assert_equal center_group_seat.are_aisle_seats_occupied, true
      end
    end
  end

  # Window seats capacity tests

  def test_window_capacity_with_one_column
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 1)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)

    assert_equal right_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 5
        assert_equal right_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal right_window_group_seat.are_window_seats_occupied, true
      end
    end

    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    left_window_group_seat = SeatGroup.new(5, 1)

    assert_equal left_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 5
        assert_equal left_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal left_window_group_seat.are_window_seats_occupied, true
      end
    end
  end

  def test_window_capacity_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 2)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)

    assert_equal right_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal right_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal right_window_group_seat.are_window_seats_occupied, true
      end
    end

    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    left_window_group_seat = SeatGroup.new(5, 2)

    assert_equal left_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal left_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal left_window_group_seat.are_window_seats_occupied, true
      end
    end
  end

  def test_window_capacity_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    right_window_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)

    assert_equal right_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      right_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal right_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal right_window_group_seat.are_window_seats_occupied, true
      end
    end
    
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    SeatGroup.new(3, 3)
    left_window_group_seat = SeatGroup.new(5, 3)

    assert_equal left_window_group_seat.are_window_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      left_window_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal left_window_group_seat.are_window_seats_occupied, false
      else
        assert_equal left_window_group_seat.are_window_seats_occupied, true
      end
    end
  end

  # Center seats capacity tests

  def test_center_capacity_with_one_column
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 1)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_all_seats_occupied, false
    passenger_numbers = [*1..5]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 5
        assert_equal center_group_seat.are_all_seats_occupied, false
      else
        assert_equal center_group_seat.are_all_seats_occupied, true
      end
    end
  end

  def test_center_capacity_with_two_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 2)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_all_seats_occupied, false
    passenger_numbers = [*1..10]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 10
        assert_equal center_group_seat.are_all_seats_occupied, false
      else
        assert_equal center_group_seat.are_all_seats_occupied, true
      end
    end
  end

  def test_center_capacity_with_three_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 3)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_all_seats_occupied, false
    passenger_numbers = [*1..15]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 15
        assert_equal center_group_seat.are_all_seats_occupied, false
      else
        assert_equal center_group_seat.are_all_seats_occupied, true
      end
    end
  end

  def test_center_capacity_with_four_columns
    SeatGroup.reset_number_of_seat_groups
    SeatGroup.new(3, 3)
    center_group_seat = SeatGroup.new(5, 4)
    SeatGroup.new(3, 3)

    assert_equal center_group_seat.are_all_seats_occupied, false
    passenger_numbers = [*1..20]
    passenger_numbers.each do |passenger_number|
      center_group_seat.assign_passenger_to_seat(passenger_number)
      if passenger_number != 20
        assert_equal center_group_seat.are_all_seats_occupied, false
      else
        assert_equal center_group_seat.are_all_seats_occupied, true
      end
    end
  end
end
require 'set'
class SeatAssigner

  def self.assign_seats(plane, number_of_passengers)
    seat_groups = plane.seat_groups
    current_passenger_number = 1

    current_passenger_number = assign_to_aisle_seats(seat_groups, current_passenger_number, number_of_passengers)
    current_passenger_number = assign_to_window_seats(seat_groups, current_passenger_number, number_of_passengers)
    assign_to_center_seats(seat_groups, current_passenger_number, number_of_passengers)
    # ADD current_passenger_number > number_of_passengers to others
  end

  def self.assign_to_aisle_seats(seat_groups, current_passenger_number, number_of_passengers)
    has_vacant_aisle_seats_indexes = [*0..seat_groups.size - 1]
    loop do
      indexes_to_skip = Set.new
      has_vacant_aisle_seats_indexes.each do |seat_group_index|
        next if indexes_to_skip.include? seat_group_index
        assign_times = seat_groups[seat_group_index].has_window_seats ? 1 : 2
        assign_times.times do
          if !assign_to_aisle_seat(seat_groups[seat_group_index], current_passenger_number)
            indexes_to_skip.add(seat_group_index)
          else
            current_passenger_number += 1
            break if current_passenger_number > number_of_passengers
          end
        end
        break if current_passenger_number > number_of_passengers
      end
      return current_passenger_number if indexes_to_skip.size == has_vacant_aisle_seats_indexes.size || current_passenger_number > number_of_passengers
    end
  end

  def self.assign_to_window_seats(seat_groups, current_passenger_number, number_of_passengers)
    return current_passenger_number if current_passenger_number > number_of_passengers
    has_vacant_window_seats_indexes = [0, seat_groups.size - 1]
    loop do
      indexes_to_skip = Set.new
      has_vacant_window_seats_indexes.each do |seat_group_index|
        next if indexes_to_skip.include? seat_group_index
        if !assign_to_window_seat(seat_groups[seat_group_index], current_passenger_number)
          indexes_to_skip.add(seat_group_index)
        else
          current_passenger_number += 1
          break if current_passenger_number > number_of_passengers
        end
        break if current_passenger_number > number_of_passengers
      end
      return current_passenger_number if indexes_to_skip.size == has_vacant_window_seats_indexes.size || current_passenger_number > number_of_passengers
    end 
  end

  def self.assign_to_center_seats(seat_groups, current_passenger_number, number_of_passengers)
    return if current_passenger_number > number_of_passengers
    has_vacant_center_seats_indexes = [*0..seat_groups.size - 1]
    loop do
      indexes_to_skip = Set.new
      has_vacant_center_seats_indexes.each do |seat_group_index|
        next if indexes_to_skip.include? seat_group_index
        assign_times = seat_groups[seat_group_index].columns - 2
        assign_times.times do
          if !assign_to_center_seat(seat_groups[seat_group_index], current_passenger_number)
            indexes_to_skip.add(seat_group_index)
          else
            current_passenger_number += 1
            break if current_passenger_number > number_of_passengers
          end
        end
        break if current_passenger_number > number_of_passengers
      end
      break if indexes_to_skip.size == has_vacant_center_seats_indexes.size || current_passenger_number > number_of_passengers
    end 
  end

  def self.assign_to_aisle_seat(seat_group, passenger_number)
    return false if seat_group.are_aisle_seats_occupied
    seat_group.assign_passenger_to_seat(passenger_number)
  end

  def self.assign_to_window_seat(seat_group, passenger_number)
    return false if seat_group.are_window_seats_occupied
    seat_group.assign_passenger_to_seat(passenger_number)
  end

  def self.assign_to_center_seat(seat_group, passenger_number)
    return false if seat_group.are_all_seats_occupied
    seat_group.assign_passenger_to_seat(passenger_number)
  end
end
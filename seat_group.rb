class SeatGroup
  @@number_of_seat_groups = 0
  attr_reader :seats, :rows, :columns, :number, :current_vacant_seat_row, :current_vacant_seat_column, :are_aisle_seats_full, :are_window_seats_full, :are_all_seats_occupied

  def initialize(rows, columns)
    @@number_of_seat_groups += 1
    @number = @@number_of_seat_groups
    @rows = rows
    @columns = columns
    @seats = []
    @rows.times do |row_index|
      @seats[row_index] = []
      columns.times do |column_index|
        @seats[row_index][column_index] = 'X'
      end
    end
    
    initialize_next_vacant_seat_column
    @current_vacant_seat_row = 0
  end

  # for unit testing purposes
  def self.reset_number_of_seat_groups
    @@number_of_seat_groups = 0
  end

  def are_aisle_seats_occupied
    # return true if are_all_seats_occupied
    @are_aisle_seats_full || false
  end

  def are_window_seats_occupied
    # return true if are_all_seats_occupied
    return true unless has_window_seats
    @are_window_seats_full || false
  end

  def are_all_seats_occupied
    return are_aisle_seats_occupied if !has_window_seats && (@columns == 1 || @columns == 2)
    return are_window_seats_occupied if !has_window_seats && (@columns == 1 || @columns == 2)
    @are_all_seats_occupied || false
  end

  def assign_passenger_to_seat(passenger_number)
    @seats[@current_vacant_seat_row][@current_vacant_seat_column] = passenger_number

    if is_vacant_currently_in_window
      set_next_seat_coming_from_window_seat
    elsif is_vacant_currently_in_aisle
      set_next_seat_coming_from_aisle_seat
    else
      set_next_seat_coming_from_center_seat
    end
  end

  def has_window_seats
    has_left_window_seats || has_right_window_seats
  end

  private

  def set_next_seat_coming_from_center_seat
    if is_current_center_row_full && is_current_column_full
      @are_all_seats_occupied = true
    elsif is_current_center_row_full
      @current_vacant_seat_row += 1
      @current_vacant_seat_column = 1
    else
      @current_vacant_seat_column += 1
    end
  end

  def set_next_seat_coming_from_window_seat
    if is_current_column_full
      reset_to_center_seats
      @are_window_seats_full = true
    else
      @current_vacant_seat_row += 1
    end
  end

  def set_next_seat_coming_from_aisle_seat
    if has_window_seats
      if is_current_column_full && has_left_window_seats
        reset_to_left_most_seats
        @are_aisle_seats_full = true
      elsif is_current_column_full && has_right_window_seats
        reset_to_right_most_seats
        @are_aisle_seats_full = true
      else
        @current_vacant_seat_row += 1
      end
    elsif @current_vacant_seat_column == get_last_column
      if is_current_column_full
        reset_to_center_seats
        @are_aisle_seats_full = true
      else
        @current_vacant_seat_column = 0
        @current_vacant_seat_row += 1
      end
    elsif @current_vacant_seat_column == 0
      @current_vacant_seat_column = get_last_column
    end
  end

  def is_current_center_row_full
    @current_vacant_seat_column + 1 == get_last_column
  end

  def is_current_column_full
    @current_vacant_seat_row + 1 == @rows
  end

  def reset_to_left_most_seats
    @current_vacant_seat_row = 0
    @current_vacant_seat_column = 0
  end

  def reset_to_right_most_seats
    @current_vacant_seat_row = 0
    @current_vacant_seat_column = get_last_column
  end

  def reset_to_center_seats
    @current_vacant_seat_row = 0
    @current_vacant_seat_column = 1
  end

  def is_vacant_currently_in_window
    (has_left_window_seats && @current_vacant_seat_column == 0) || (has_right_window_seats && @current_vacant_seat_column == get_last_column)
  end

  def is_vacant_currently_in_aisle
    @current_vacant_seat_column == 0 || @current_vacant_seat_column == get_last_column
  end

  def initialize_next_vacant_seat_column
    if has_left_window_seats
      @current_vacant_seat_column = @columns - 1
    else
      @current_vacant_seat_column = 0
    end
  end

  def has_left_window_seats
    @number == 1
  end

  def has_right_window_seats
    @number == @@number_of_seat_groups
  end

  def get_last_column
    @columns - 1
  end
end
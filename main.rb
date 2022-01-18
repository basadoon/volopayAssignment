require './plane'
require './seat_assigner'
require 'test/unit'
require 'io/console'

# Note: run using: ruby main.rb

def validate_zero_and_negative_inputs(input_message, error_message)
  loop do 
    puts input_message
    input = gets.chomp.to_i

    return input if input > 0
    puts error_message
  end
end

seat_groups = validate_zero_and_negative_inputs("How many group of seats do you want?",
  "Group of Seats less than 1 is invalid")
  
plane = Plane.new

puts "\nNote: Input the number of rows and columns for each seat groups, starting from the leftmost.\n"
print "\npress any key to continue..."                                                                                                    
STDIN.getch

seat_groups.times do |index|
  columns = validate_zero_and_negative_inputs("\nInput the Number of columns of the seats (for group no.#{index+1}):",
    "Columns less than 1 is invalid")
  rows = validate_zero_and_negative_inputs("\nInput the Number of rows of the seats (for group no.#{index+1}):",
    "Rows less than 1 is invalid")
  plane.add_seat_group(columns, rows)
end

passengers = validate_zero_and_negative_inputs("\nInput the Number of passengers:",
  "Passengers less than 1 is invalid")

SeatAssigner.assign_seats(plane, passengers)
puts "\nPlane Seating arragement for #{passengers} passengers."
puts "Note: the character X means that the seat is unoccupied.\n"
puts "Another Note: the arrangement of the group of seats are shown from top to bottom."
puts "The uppermost group is the leftmost group of seats, while the lowermost is the rightmost group of seats. \n"
plane.seat_groups.each do |seat_group|
  puts ""
  seat_group.seats.each { |seats| puts seats.join(" ") }
end
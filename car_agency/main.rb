require_relative 'customers'
require_relative 'vehicles'

if File.zero?("vehicles.txt")
	@vehicles = []
else
	@vehicles = File.open("vehicles.txt", "r"){|from_file| Marshal.load(from_file)}
	#@vehicles = Marshal.load(File.binread("vehicles.txt"))
	#both lines do same thing
end

if File.zero?("customers.txt")
	@customers = []
else
	@customers = Marshal.load(File.binread("customers.txt"))
end

def main_menu
	puts "Choose From the Following:"
	puts "--------------------------"
	puts "1. Enter New Vehicles\n"
	puts "2. List All Vehicles\n"
	puts "3. List Available Vehicles" #only show vehicles where customer attribute == nil
	puts "4. Return a Vehicle" #look up vehicle and set customer to nil

	puts "5. Enter New Customers\n"
	puts "6. List All Customers\n"
	puts "0. End Program"

	choice = gets.chomp.to_i

	case choice
		when 1
			clear_screen
			enter_vehicles
		when 2
			clear_screen
			list_vehicles
		when 3
			clear_screen
			avail_vehicles
		when 4
			clear_screen
			return_vehicle
		when 5
			clear_screen
			enter_customers
		when 6
			clear_screen
			list_customers
		when 0
			clear_screen
			puts "Program terminated."
		else
			clear_screen
			puts "Invalid Selection."
			main_menu
	end
end

def main_menu_return
	print "Ready to return to Main Menu [y/n]? "
	choice = gets.chomp.downcase

	case choice
		when "y"
			clear_screen
			main_menu
		else
			main_menu_return  
	end
end

def clear_screen
	Gem.win_platform? ? (system "cls") : (system "clear")
end

main_menu
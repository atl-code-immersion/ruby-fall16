class Vehicle

	attr_reader :year, :make, :model

	def initialize(year, make, model)
		@year = year
		@make = make
		@model = model
	end

end

class Customer

	attr_accessor :first_name, :last_name, :age, :city

	def initialize(first_name, last_name, age, city)
		@first_name = first_name
		@last_name = last_name
		@age = age
		@city = city
	end

end

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
	puts "1. Enter New Vehicles"
	puts "2. List All Vehicles"
	puts "3. Enter New Customers"
	puts "4. List All Customers"
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
			enter_customers
		when 4
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

def enter_vehicles
	puts "Enter new Vehicles. Type 'done' for the make when completed."

	make = ""
	while make != "done"
		print "Vehicle Make: "
		make = gets.chomp
		if make == "done"
			break
		end
		print "Vehicle Model: "
		model = gets.chomp
		print "Vehicle Year: "
		year = gets.chomp

		@vehicles.push(Vehicle.new(year, make, model))
		File.open("vehicles.txt", "w"){|f| f.write(Marshal.dump(@vehicles))}
		clear_screen
	end
	main_menu
end

def list_vehicles
	@vehicles.each_with_index do |vehicle, index|
		puts "#{index+1}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
	end
	main_menu
end

def enter_customer
	puts "Enter new Customers. Type 'done' for the First Name when completed."

	first_name = ""
	while first_name != "done"
		print "First Name: "
		first_name = gets.chomp
		if first_name == "done"
			break
		end
		print "Last Name: "
		last_name = gets.chomp
		print "Age: "
		age = gets.chomp.to_i
		print "City: "
		city = gets.chomp


		@customers.push(Customer.new(first_name, last_name, age, city))
		File.open("customers.txt", "w"){|f| f.write(Marshal.dump(@customers))}
		clear_screen
	end
	main_menu
end

def list_vehicles
	@vehicles.each_with_index do |vehicle, index|
		puts "#{index+1}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
	end
	main_menu
end



def clear_screen
	Gem.win_platform? ? (system "cls") : (system "clear")
end

main_menu
class Vehicle

	attr_reader :year, :make, :model

	def initialize(year, make, model)
		@year = year
		@make = make
		@model = model
	end

end

if File.zero?("vehicles.txt")
	@vehicles = []
else
	@vehicles = File.open("vehicles.txt", "r"){|from_file| Marshal.load(from_file)}
end

def main_menu
	puts "Choose From the Following:"
	puts "--------------------------"
	puts "1. Enter New Vehicles"
	puts "2. List All Vehicles"
	puts "0. End Program"

	choice = gets.chomp.to_i

	case choice
		when 1
			enter_vehicles
		when 2
			list_vehicles
		when 0
			puts "Program terminated."
		else
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
	end
	main_menu
end

def list_vehicles
	@vehicles.each_with_index do |vehicle, index|
		puts "#{index+1}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
	end
	main_menu
end


main_menu
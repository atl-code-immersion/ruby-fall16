class Vehicle

	attr_reader :year, :make, :model
	attr_accessor :customer

	def initialize(year, make, model, customer)
		@year = year
		@make = make
		@model = model
		@customer = customer
	end

end

def enter_vehicles
	puts "*****************************"
	puts "****  New Vehicle Entry  ****"
	puts "**** ==================  ****"
	puts "**** Type 'done' for the ****"
	puts "**** make, when complete ****"
	puts "*****************************"

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

		@vehicles.push(Vehicle.new(year, make, model, nil))
		File.open("vehicles.txt", "w"){|f| f.write(Marshal.dump(@vehicles))}
		clear_screen
	end
	main_menu
end

def list_vehicles
	puts "************************"
	puts "***** All Vehicles *****"
	puts "************************"

	@vehicles.each_with_index do |vehicle, index|
		puts "#{index+1}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
		print "Currently rented to: "
		if vehicle.customer == nil
			puts "no one\n\n"
		else
			puts "#{vehicle.customer.first_name} #{vehicle.customer.last_name}\n\n"
		end
	end

	puts "\n\n"
	main_menu_return
end

def avail_vehicles
	puts "******************************"
	puts "***** Available Vehicles *****"
	puts "******************************"

	count = 1
	available_vehicles = []
	@vehicles.each do |vehicle|
		if vehicle.customer == nil
			puts "#{count}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
			available_vehicles.push(vehicle)
			count += 1
		end
	end

	puts "\n======================================="
	print "Which vehicle will you be renting out: "
	choice = gets.chomp.to_i
	puts ""

	index = @vehicles.index(available_vehicles[(choice - 1)])

	vehicle_assign(index)
	# main_menu_return
end

def vehicle_assign(index)
	puts "Provide Customer info for look-up..."
	print "First Name: "
	first_name = gets.chomp
	print "Last Name: "
	last_name = gets.chomp

	current_customer = ""
	@customers.each do |customer|
		if customer.first_name == first_name && customer.last_name == last_name
			current_customer = customer
		end
	end


	@vehicles[index].customer = current_customer

	File.open("vehicles.txt", "w"){|f| f.write(Marshal.dump(@vehicles))}

	puts "Success!"
	puts "#{@vehicles[index].make} #{@vehicles[index].model} is now rented to #{@vehicles[index].customer.first_name} #{@vehicles[index].customer.last_name}"
	main_menu_return
end

def return_vehicle
	puts "**************************"
	puts "***** Vehicle Return *****"
	puts "**************************"

	puts "Who is the customer?"
	print "First Name: "
	first_name = gets.chomp
	print "Last Name: "
	last_name = gets.chomp

	current_customer = ""
	@customers.each do |customer|
		if customer.first_name == first_name && customer.last_name == last_name
			current_customer = customer
		end
	end

	puts ""
	puts "#{current_customer.first_name} #{current_customer.last_name}'s Current Rentals"
	puts "================================"

###############
	count = 1
	rented_vehicles = []
	puts "*************"
	puts current_customer
	puts "*************"
	@vehicles.each do |vehicle|
		puts vehicle.customer
		if current_customer == vehicle.customer
			puts "#{count}. #{vehicle.make} #{vehicle.model} (#{vehicle.year})"
			rented_vehicles.push(vehicle)
			count += 1
		end
	end
################
	if rented_vehicles.length != 0
		puts "\n======================================="
		print "Which vehicle will #{current_customer.first_name} #{current_customer.last_name} be returning? "
		choice = gets.chomp.to_i
		puts ""

		index = @vehicles.index(rented_vehicles[(choice - 1)])

		@vehicles[index].customer = nil
		File.open("vehicles.txt", "w"){|f| f.write(Marshal.dump(@vehicles))}
		puts "Vehicle Returned!"
	else
		puts "No current rentals."
	end
	main_menu_return
end

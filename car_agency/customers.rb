class Customer

	attr_accessor :first_name, :last_name, :age, :city

	def initialize(first_name, last_name, age, city)
		@first_name = first_name
		@last_name = last_name
		@age = age
		@city = city
	end

end

def enter_customers
	puts "*******************************"
	puts "****  New Customer Entry   ****"
	puts "****  ==================   ****"
	puts "**** Type 'done' for first ****"
	puts "****  name, when complete  ****"
	puts "*******************************"

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
	puts ""
	main_menu_return
end

def list_customers
	puts "*********************"
	puts "*** Our Customers ***"
	puts "*********************"
	@customers.each_with_index do |customer, index|
		puts "#{index+1}. #{customer.first_name} #{customer.last_name} (#{customer.age}), #{customer.city}"
	end
	puts ""
	main_menu_return
end
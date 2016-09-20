inventory = {"Highlander"=>"Toyota","Cmax"=>"Ford","Fiesta"=>"Ford","Civic"=>"Honda","Mx-6"=>"Mazda"}

puts "What model car are you looking for?"

car = gets.chomp.downcase.capitalize

in_stock = false

inventory.each do |model, make|
	if car == model
		puts "Oh, you're looking for #{model}. Our #{make} selection is right over here!"
		in_stock = true
	end
end

if in_stock == false
#if !in_stock (same as above)
	puts "Sorry, all out of stock of those. Can I interest you in a Bugati?"
end




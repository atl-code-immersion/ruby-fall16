# puts "Which do you prefer: Dog or Cat?"

# choice = gets.chomp.downcase

# if choice == "dog"
# 	puts "Woof!"
# else
# 	puts "Meow!"
# end

puts "What is your favorite animal?"

choice = gets.chomp.downcase

if choice == "dog" || choice == "puppy"
# if choice == "dog" or choice == "puppy"
	puts "Woof!"
elsif choice == "cat"
	puts "Meow!"
elsif choice == "horse"
	puts "Neigh."
elsif choice == "snake"
	puts "Hiss!"
else
	puts "Rowr?"
end











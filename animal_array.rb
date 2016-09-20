animals = %w(dog cat zebra elephant lemur honey-badger)

fave = "cat"

found_fave = false

animals.each do |animal|
	if animal == fave
		found_fave = true
	end
end

if found_fave
	puts "They have my favorite!"
end
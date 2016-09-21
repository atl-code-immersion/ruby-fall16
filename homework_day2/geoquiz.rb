=begin

Question #4:

Geo-Quiz!

Create a program with a hash of countries & capitals - don't worry I'll give it to you:

Ask the user for the capital of each country, and tell them if they are Correct or Wrong. Also, keep score and give their score at the end of the quiz. Maybe have some smart-alecky comments about their score (see example below).


=end

cos_n_caps = {"USA" => "Washington, DC", "Canada"=>"Ottawa", "United Kingdom"=>"London", "France"=>"Paris", "Germany"=>"Berlin", "Egypt"=>"Cairo", "Ghana"=>"Accra", "Kenya"=>"Nairobi", "Somalia"=>"Mogadishu", "Sudan"=>"Khartoum", "Tunisia"=>"Tunis", "Japan"=>"Tokyo", "China"=>"Beijing", "Thailand"=>"Bangkok", "India"=>"New Delhi", "Philippines"=>"Manila", "Australia"=>"Canberra", "Kyrgyzstan"=>"Bishkek"}

# we can't shuffle a Hash, but what we can do is
# convert it to an Array, shuffle it, and then
# convert it back to a Hash
cos_n_caps = Hash[cos_n_caps.to_a.shuffle]

score = 0

cos_n_caps.each do |k,v|
	puts "What is the capital of #{k}?"
	answer = gets.chomp.downcase.capitalize

	# having some conditionals for the two-word capitals
	# and being somewhat lenient with what they've entered
	if answer == "New delhi" || answer == "Delhi"
		answer = "New Delhi"
	elsif answer == "Washington, dc" || answer == "Washington"
		answer = "Washington, DC"
	end

	if answer == v
		puts "CORRECT!"
		score += 1
	else
		puts "WRONG! It's #{v}, ya dummy."
	end
end

puts "\n\nYour final score is: #{score}."

if score > (cos_n_caps.length/2)
	puts "You're a geo-wiz!"
else
	puts "And you wonder why you didn't get the job at the UN."
end

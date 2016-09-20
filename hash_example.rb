profile = {"Name"=>"Aaron","Age"=>35,"Hometown"=>"Santa Clarita","Favorite Food"=>"Burritos"}

profile.each do |k,v|
	case k
		when "Name"
			puts "My name is #{v}"
		when "Age"
			puts "I'm #{v}-years-old"
		when "Hometown"
			puts "I'm from #{v}"
		else
			puts "And I love to eat #{v}"
	end  
end
# Question #3:
# Create a program that takes a name (or any word, really), 
# and spells it out, one letter at a time.

puts "What's your name?"

name = gets.chomp

count = 0

until count == name.length
	puts name[count].upcase
	count += 1
end

# another option:
# name.each_char do |x|
# 	puts x
# end

puts "That spells #{name}."

# Extra Challenge: Try to spell it out all in one line, 
# separating the letters with a comma:

count = 0

while count < name.length
	if count < name.length - 1
		print "#{name[count].upcase}, "
	else
		puts "#{name[count].upcase}"
	end
	count += 1
end

# another option:
# puts name.upcase.split(//).join(", ")

puts "That spells #{name}."
=begin

Question #6:

Do All the Maths!

Create a program that will take two numbers and then gives the user a choice of what kind of arthimetic you'd like done to the two numbers. Include at least: add, subtract, multiply and divide.

=end


puts "Let's do some math! First we need some numbers..."
print "Number One: "
num1 = gets.chomp.to_f
print "Number Two: "
num2 = gets.chomp.to_f

puts "Now what would you like done with #{num1} & #{num2}?"
puts "------------------------"
puts "1. Add"
puts "2. Subtract"
puts "3. Multiply"
puts "4. Divide"
puts "5. Exit Program"

choice = gets.chomp.to_i

case choice
	when 1
		puts "your answer is: #{num1+num2}"
	when 2
		if num1 > num2
			puts "your answer is: #{num1-num2}"
		else
			puts "your answer is: #{num2-num1}"
		end
	when 3
		puts "your answer is #{num1*num2}"
	when 4
		if num1 > num2
			puts "your answer is: #{num1/num2}"
		else
			puts "your answer is: #{num2/num1}"
		end
	else
		puts "Okay, whatevs. Later."
end
# Methods-focused version of Day 2 HW #6


def menu(num1,num2)
	puts "Now what would you like done with #{num1} & #{num2}?"
	puts "------------------------"
	puts "1. Add"
	puts "2. Subtract"
	puts "3. Multiply"
	puts "4. Divide"
	puts "5. Get New Numbers"
	puts "6. Exit Program"

	choice = gets.chomp.to_i

	case choice
		when 1
			puts `clear`
			add(num1,num2)
			menu(num1,num2)
		when 2
			puts `clear`
			subtract(num1,num2)
			menu(num1,num2)
		when 3
			puts `clear`
			multiply(num1,num2)
			menu(num1,num2)
		when 4
			puts `clear`
			divide(num1,num2)
			menu(num1,num2)
		when 5
			puts `clear`
			take_numbers
		when 6
			puts `clear`
			puts "Okay, see you later."
		else
			puts `clear`
			puts "Not a valid selection."
			menu(num1,num2)
	end
end

def add(num1,num2)
	puts "Your answer is: #{num1+num2}"
end

def subtract(num1,num2)
	if num1 > num2
		puts "Your answer is: #{num1-num2}"
	else
		puts "Your answer is: #{num2-num1}"
	end
end

def multiply(num1,num2)
	puts "Your answer is: #{num1*num2}"
end

def divide(num1,num2)
	if num1 > num2
		puts "Your answer is: #{num1/num2}"
	else
		puts "Your answer is: #{num2/num1}"
	end
end

def take_numbers
	print "Number One: "
	num1 = gets.chomp.to_f
	print "Number Two: "
	num2 = gets.chomp.to_f

	menu(num1,num2)
end

puts "Let's do some math! First we need some numbers..."
take_numbers

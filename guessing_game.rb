# num1 = rand(1..10)

# puts "What number between 1 and 10 am I thinking of?"

# num2 = gets.chomp.to_i

# if num1 == num2
# 	puts "Whoa. You're amazing!"
# else
# 	puts "Wrong. It was #{num1}. You lose. Good day, sir."
# end

num1 = rand(1..100)

puts "What number between 1 and 100 am I thinking of?"

num2 = gets.chomp.to_i

if num1 == num2
	puts "Whoa. You're amazing!"
elsif num2 >= (num1 - 5) && num2 <= (num1 + 5)
	puts "Pretty close! It was #{num1}"
else
	puts "Wrong. It was #{num1}. But I appreciate the effort."
end




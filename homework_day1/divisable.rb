# Question #2: Is It Divisible?
# Create a program that takes two numbers from the user 
# and find out if the first is divisible by the second.

puts "Give me two numbers..."

print "A larger one: "
num1 = gets.chomp.to_i

print "And a smaller one: "
num2 = gets.chomp.to_i

if num1 % num2 == 0
	puts "#{num1} is divisible by #{num2}!"
	puts "And the quotient is #{num1/num2}."
else
	puts "NOT DIVISIBLE!"
	puts "A remainder of #{num1%num2}...lame."
end
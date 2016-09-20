# Question #5
# Create a Ruby program that finds how many 
# prime numbers are between 1 and a number given by the user.

require 'prime'

puts "Give me a number greater than 1:"

num = gets.chomp.to_i


count = 0

# the long way, which starts to really lag at 10,000,000
# x = 2
# while x <= num
# 	if Prime.prime?(x)
# 		count += 1
# 	end
# 	x += 1
# end

# the better way:
Prime.each(num) do |prime|
	count += 1
end

puts "Fun fact: there are #{count} prime numbers between 1 and #{num}!"


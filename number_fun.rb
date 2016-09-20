numbers = []

5.times do
	print "Give me a number: "
	num = gets.chomp.to_i
	numbers.push(num)
end

sum = 0
product = 1

numbers.each do |num|
	sum += num
	product *= num
end

puts "The sum of those numbers is #{sum}"
puts "The product of those numbers is #{product}"
puts "The largest number was #{numbers.sort.last}"
puts "The smallest number was #{numbers.sort.first}"









=begin

Question #5:

Adding from random arrays - write a program that takes two arrays of random numbers, the length of which is decided by the user, and adds the corresponding items in each array (i.e., the first number in the first array will be added to the first item in the second array).

=end

puts "How many numbers should be in our arrays?"
len = gets.chomp.to_i

arr1 = []
arr2 = []

len.times do
	arr1.push(rand(1..100))
	arr2.push(rand(1..100))
end

count = 0
while count < arr1.length
	puts "#{arr1[count]} + #{arr2[count]} = #{arr1[count] + arr2[count]}"
	count += 1
end








=begin

Question #1:

"Students & Teachers" - write a program that has two arrays, one of student names and one of teacher names.

Ask the user for their name, and greet them according to their role (if they're a teacher, it says one thing, if they're a student, it says something else)
	
=end

students = %w(Andrew Kishan Stephanie Chanel Kyle)

teachers = %w(Aaron Mandy Katie Zapata)

puts "Greetings! Can I have your name?"

name = gets.chomp.downcase.capitalize

if students.include? name
	puts "Did you do your homework, #{name}?"
elsif teachers.include? name
	puts "#{name}, why didn't you bring donuts?"
else
	puts "You must be new here."
end








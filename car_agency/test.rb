require_relative 'vehicles'
require_relative 'customers'

if File.zero?("vehicles.txt")
	@vehicles = []
else
	@vehicles = File.open("vehicles.txt", "r"){|from_file| Marshal.load(from_file)}
	#@vehicles = Marshal.load(File.binread("vehicles.txt"))
	#both lines do same thing
end

if File.zero?("customers.txt")
	@customers = []
else
	@customers = Marshal.load(File.binread("customers.txt"))
end


@customers.each do |c|
	puts c
end
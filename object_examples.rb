class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
  	@name
  end

  def age
  	@age
  end
end

class Pet

	attr_accessor :name, :color, :species, :age
	attr_reader :license

	def initialize(name,color,species,age,license)
		@name = name
		@color = color
		@species = species
		@age = age
		@license = license
	end
end

my_profile = Person.new("Aaron", 34)

puts "Hello, #{my_profile.name}. You are #{my_profile.age}-years-old."

my_pet = Pet.new("Rover","Brown","Dog",12,"A390A02")

puts "Hey there, #{my_pet.name}! You're a good #{my_pet.species}, aren't you?"




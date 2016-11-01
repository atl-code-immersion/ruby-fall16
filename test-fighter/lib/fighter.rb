class Fighter

	attr_accessor :name, :health, :power

	def initialize(name:,health:,power:)
		@name = name
		@health = health
		@power = power
	end

	def attack(enemy)
		enemy.lose_health(self.power, enemy.health)
	end

	def lose_health(enemy_power, health)
    self.health -= enemy_power
  end

end
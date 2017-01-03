=begin
Help match up teams for the first round in a seed-based tournament In a seeded tournament, and during the first round, the top seed is matched with the bottom seed, the 2nd highest team is matched with the second lowest, etc.  

Example:

Seeds
1. Wisconsin
2. Michigan
3. Michigan State
4. Indiana

Matchups:
(1) Wisconsin versus (4) Indiana,
(2) Michigan versus (3) Michigan State 

Create the first round matches for a tournament using seeds.

Your program should include a menu, where you can enter teams, and then seed them.  

Example: 

Welcome to My Tournament Generator. Enter a selection:
1. Enter teams
2. List teams
3. List matchups
0. Exit program
 

Your program should check for the following: 

1. If an odd number of teams are entered, the top-seeded team gets a bye (doesn't play)

Example:

Seeds
1. Wisconsin
2. Michigan
3. Michigan State
4. Indiana
5. Purdue

Matchups: 
(1) Wisconsin has a bye
(2) Michigan versus (5) Purdue
(3) Michigan State versus (4) Indiana

Hints:
You should utilize Classes (probably just one).
Make sure you can do multiple match-ups (that is, match up once, then come back and match-up again).

=end

class Team

	attr_reader :name
	attr_accessor :name, :ranking

	def initialize(name, ranking)
		@name = name
		@ranking = ranking
	end

end

@teams = []

def menu
	puts "Welcome to My Tournament Generator. Enter a selection:"
	puts "1. Enter teams"
	puts "2. List teams"
	puts "3. List matchups"
	puts "0. Exit program"

	choice = gets.chomp.to_i

	case choice
		when 1
			clear_screen
			enter_teams
		when 2
			clear_screen
			list_teams
		when 3
			clear_screen
			matchups
		when 0
			clear_screen
			puts "Okay, catch ya later."
		else
			clear_screen
			puts "Not a valid selection. Try again, please."
			menu
	end
end

def clear_screen
	Gem.win_platform? ? (system "cls") : (system "clear")
end

def return_to_menu
	puts "Return to Menu? [y/n]"
	ans = gets.chomp.downcase

	case ans[0]
		when "y"
			clear_screen
			menu
		when "n"
			clear_screen
			puts "Okay. Well...see you around, then. I guess."
		else
			clear_screen
			puts "Huh? Yes or No, please."
			return_to_menu
	end
end

def enter_teams
	puts "Enter team names & rankings. When finished, type in 'done' instead of team name."

	name = ''
	while name != 'done'
		print "School Name: "
		name = gets.chomp
		if name.downcase == 'done'
			break
		end
		print "Ranking: "
		ranking = gets.chomp.to_i
		
		while rank_check(ranking)
			puts "There's already a team with that ranking."
			print "Please check your facts and re-enter ranking: "
			ranking = gets.chomp.to_i
		end
		
		@teams.push(Team.new(name, ranking))
	end
	@teams.sort! { |a,b| a.ranking <=> b.ranking }
	#@teams = @teams.sort_by {|team| team.ranking}
	return_to_menu
end

def rank_check(num)
	ranking_exists = false
	@teams.each do |t|
		if num == t.ranking
			ranking_exists = true
		end
	end
	return ranking_exists
end

def list_teams
	puts "Here are the Teams..."
	sleep(1)
	puts "---------------------"

	@teams.each do |team|
		puts "#{team.ranking}. #{team.name}"
	end
	return_to_menu
end

def matchups
	temp_arr = []
	@teams.each do |t|
		temp_arr.push(t)
	end

	if temp_arr.length % 2 != 0
		puts "(1) #{temp_arr.delete_at(0).name} has a bye"
	end

	while temp_arr.length > 0
		team1 = temp_arr.delete_at(0)
		team2 = temp_arr.pop
		puts "(#{team1.ranking}) #{team1.name} versus (#{team2.ranking}) #{team2.name}"
	end

	return_to_menu
end

menu
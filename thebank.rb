class User

	attr_accessor :un, :pw, :name

	def initialize(un,pw,name)
		@un = un
		@pw = pw
		@name = name
	end

end

class Account

	attr_accessor :balance, :nickname, :user

	def initialize(balance, nickname, user)
		@balance = balance
		@nickname = nickname
		@user = user
	end

end

@users = []
@accounts = []

def main
	@user = ""

	puts "Welcome to Tech Talent Bank!"
	puts "Thank you for entrusting us with your hard-earned cash."
	puts "Choose from the following:"
	puts "1. Sign In"
	puts "2. Sign Up"

	choice = gets.chomp.to_i

	case choice
		when 1
			puts `clear`
			sign_in
		when 2
			puts `clear`
			sign_up
		else
			puts `clear`
			puts "You chose...poorly."
			main
	end
end

def sign_in
	print "Username: "
	un = gets.chomp

	user_found = false
	@users.each do |user|
		if user.un == un
			user_found = true
			@user = user
		end
	end

	if user_found	
		
		attempts = 3
		while attempts > 0
			print "Password: "
			pw = gets.chomp

			if @user.pw == pw
				system("clear")
				session_menu
				# attemps -= 3
			else
				puts "Password doesn't match."
			end
			attempts -= 1
		end
		main
	else
		puts "User not found."
		main
	end
end

def sign_up
	puts "Thanks for choosing us."
	print "Create a username: "
	un = gets.chomp
	print "Please give your real name: "
	name = gets.chomp
	print "Create a password: "
	pw = gets.chomp

	@user = User.new(un, pw, name)
	@users.push(@user)

	session_menu
end

def session_menu
	@current_acct = ""

	puts "Welcome back, #{@user.name}!"
	puts "Please choose from the following:"
	puts "1. Create an Account"
	puts "2. View/Modify Account"
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice
		when 1
			system("clear")
			create_account
		when 2
			system("clear")
			account_lookup
		when 3
			system("clear")
			main
		else
			system("clear")
			puts "Invalid selection."
			session_menu
	end 
end

def create_account
	puts "To create an account, we need an intial deposit."
	print "How much will you depositing today? $"
	deposit = gets.chomp.to_f
	print "Give this account a nickname: "
	nickname = gets.chomp

	@current_acct = Account.new(deposit, nickname, @user)
	@accounts.push(@current_acct)

	system("clear")
	view_account
end

def account_lookup
	user_accounts = []

	@accounts.each do |acct|
		if acct.user == @user
			user_accounts.push(acct)
		end
	end

	if user_accounts.length == 0
		puts "You have no accounts currently open."
		create_account
	else
		puts "Choose account to view/modify:"
		user_accounts.each_with_index do |acct, index|
			puts "#{index+1}. #{acct.nickname}"
		end

		choice = gets.chomp.to_i
		@current_acct = user_accounts[choice-1]
		view_account
	end
end

def view_account
	puts "#{@user.name}'s '#{@current_acct.nickname}' account"
	puts "...with a balance of $#{@current_acct.balance}"
	puts "---------------------------"
	puts "Choose from the following:"
	puts "1. Deposit"
	puts "2. Withdrawal"
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice
		when 1
			system("clear")
			deposit
		when 2
			system("clear")
			withdrawal
		when 3
			system("clear")
			main
		else
			system("clear")
			puts "Invalid selection"
			view_account
	end
end

def deposit
	print "How much would you like deposit today: $"
	amount = gets.chomp.to_f
	@current_acct.balance += amount
	system("clear")
	view_account
end

def withdrawal
	print "How much would you like withdraw today: $"
	amount = gets.chomp.to_f
	# overdraft check?
	@current_acct.balance -= amount
	system("clear")
	view_account
end

main
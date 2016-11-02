def build_deck
	numbers = %w(2 3 4 5 6 7 8 9 10 J Q K A)
	suits = %w(♦ ♠ ♥ ♣)

	card = []
	deck = []

	numbers.each do |num|
		suits.each do |suit|
			card.push(num)
			card.push(suit)
			deck.push(card)
			card = []
		end
	end

	return deck
end

def create_hand(deck)
	arr = []
	5.times do
		card = deck.sample
		arr.push(card)
		deck.delete(card)
	end
	return arr
end

def royal_flush
end

def straight_flush
end

def four_kind
end

def full_house
end

def flush
end

def straight
end

def three_kind
end

def two_pair
end

def pair(hand)
end

def duplicate_search(hand)
	
	numbers = hand.map {|row| row[0]}
	counts = Hash.new 0


	if numbers.uniq.length == numbers.length
		return {}
	else

		numbers.sort.each do |item| 
			counts[item] += 1 
		end

		counts = counts.sort_by {|key, value| value}.to_h
	end
end


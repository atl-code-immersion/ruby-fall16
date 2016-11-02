require_relative 'method_storage'

deck = build_deck

# deck.each_with_index do |card, index|
# 	puts "#{index+1}. #{card[0]}#{card[1]}"
# end

user_hand = create_hand(deck)
dealer_hand = create_hand(deck)

print user_hand
puts ""
print dealer_hand
puts ""


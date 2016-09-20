# Question #4: Pig Latin Translator
# Write a program that translates one English word into Pig Latin.

	# Because the rules for Pig Latin can vary, I'll be specific:

	# 1. If the given word starts with a consonant, move only that consonant to end and then add "ay" to the end (e.g.: coffee -> offeecay, blogger -> loggerbay)
	# 2. If the given word starts with a vowel, add "way" to the end of the word (e.g., office -> officeway)

print "Give me a word: "
word = gets.chomp.downcase

# convoluted way:

if word[0] == "a" || word[0] == "e" || word[0] == "i" || word[0] == "o" || word[0] == "u"
	pl_word = word + "way"
else
	#word[0] = consonant
	if word[1] != "a" && word[1] != "e" && word[1] != "i" && word[1] != "o" && word[1] != "u"
		#word[1] is a consonant
		pl_word = word[2..word.length-1] + word[0..1] + "ay"
	else
		pl_word = word[1..word.length-1] + word[0] + "ay"
	end
end

puts "Ah, you mean '#{pl_word}'!"

# Much easier way using .include?:

vowels = "aeiou"
consonants = "bcdfghjklmnpqrstvwxyz"

if vowels.include?(word[0])
	#word[0] is a vowel
	pl_word = word + "way"
else
	#word[0] is a consonant
	if consonants.include? word[1]
		#word[1] is a consonant
		pl_word = word[2..word.length-1] + word[0..1] + "ay"
	else
		#word[1] is a vowel
		pl_word = word[1..word.length-1] + word[0] + "ay"
	end
end

puts "Ah, you mean '#{pl_word}'!"
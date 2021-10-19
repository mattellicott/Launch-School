# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!

print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter an adjective: "
adj = gets.chomp
print "Enter an adverb: "
adv = gets.chomp

sentence_1 = "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"
sentence_2 = "The #{adj} #{noun} #{verb}s #{adv} over the lazy dog."
sentence_3 = "The #{noun} #{adv} #{verb}s up #{adj} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample

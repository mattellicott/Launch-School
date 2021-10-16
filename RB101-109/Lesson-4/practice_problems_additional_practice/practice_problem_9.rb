words = "the flintstones rock"

cap_words = words.split.map { |word| word.capitalize! }.join(' ')
p cap_words

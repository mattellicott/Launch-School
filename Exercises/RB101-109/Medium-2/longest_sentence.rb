def scan_file(string)
  file = File.open(string)
  sentences = file.read.scan(/[^\.!?]+[\.!?]/)

  word_count = 0
  longest_sentence = ''

  sentences.each do |x|
    if x.split.size > word_count
      word_count = x.split.size
      longest_sentence = x.strip.gsub("\n", ' ').delete("\"")
    end
  end
  puts longest_sentence
  puts word_count
end

scan_file("example_text1.txt")
scan_file("example_text2.txt")

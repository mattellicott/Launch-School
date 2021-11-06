require 'yaml'
data = YAML.load_file("madlibs_revisited.yml")

data[:lines].each do |line|
  line.gsub!("%{noun}", data[:noun].sample)
  line.gsub!("%{verb}", data[:verb].sample)
  line.gsub!("%{adjective}", data[:adjective].sample)
  line.gsub!("%{adverb}", data[:adverb].sample)
  puts line
end

# data[:lines].each do |line|
#   puts format(line, noun: data[:noun].sample,
#                     verb: data[:verb].sample,
#                     adjective: data[:adjective].sample,
#                     adverb: data[:adverb].sample)
# end

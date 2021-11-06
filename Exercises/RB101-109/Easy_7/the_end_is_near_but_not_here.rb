# def penultimate(string)
#   words = string.split
#   words[-2]
# end

def penultimate(string)
  return '' if string == ''
  words = string.split
  words[((words.size / 2.0).ceil - 1)]
end

p penultimate('last word') == 'last'
p penultimate('Launch is great!') == 'is'
p penultimate('') == ''
p penultimate('last') == 'last'

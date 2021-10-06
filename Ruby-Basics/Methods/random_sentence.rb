names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(array)
  array.sample
end
def activity(array)
  array.sample
end
def sentence(value1, value2)
  "#{value1} went #{value2} today!"
end

puts sentence(name(names), activity(activities))

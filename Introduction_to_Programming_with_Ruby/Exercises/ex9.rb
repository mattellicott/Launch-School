# 1
h = {a:1, b:2, c:3, d:4}
puts h[:b]

# 2
h[:e] = 5
puts h

# 3
h.select! { |k,v| v >= 3.5 }
puts h

def toggle_lights(int)
  lights = {}
  result = []

  1.upto(int) { |i| flip_switches!(lights, i, int) }
  1.upto(int) { |i| result << i if lights[i] == 'on' }

  result
end

def flip_switches!(lights, tick, int)
  tick_sum = tick
  while tick_sum <= int
    lights[tick_sum] = lights[tick_sum] == 'on' ? 'off' : 'on'
    tick_sum += tick
  end
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]

def toggle_lights(int)
  lights = []

  1.upto(int) do |i|
    flip_switches!(lights, i, int)
    output_lights(lights, i)
  end
  lights.compact
end

def flip_switches!(lights, tick, int)
  tick_sum = tick
  while tick_sum <= int
    lights[tick_sum] = lights[tick_sum] == nil ? tick_sum : nil
    tick_sum += tick
  end
end

def output_lights(lights, round)
  if round == 1
    puts 'round 1: every light is turned on'
    return
  end
  lights_on = light_status_to_string(lights, 'on')
  lights_off = light_status_to_string(lights, 'off')

  puts "round #{round}: lights #{lights_off} are now off; #{lights_on} are on"
end

def light_status_to_string(lights, status)
  lights_arr = []

  if status == 'off'
    lights.each_with_index do |v, i|
      next if i == 0
      lights_arr << i if v == nil
    end
  else
    lights_arr = lights.compact
  end

  if lights_arr.size == 2
    lights_arr.join(' and ')
  else
    lights_arr[-1] = 'and ' + lights_arr[-1].to_s
    lights_arr.join(', ')
  end
end

p toggle_lights(5) == [1, 4]
#p toggle_lights(10) == [1, 4, 9]
#p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

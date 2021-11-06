def swap_name(string)
  name = string.split
  "#{name[1]}, #{name[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

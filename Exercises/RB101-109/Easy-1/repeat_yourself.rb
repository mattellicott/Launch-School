def repeat(str,int)
  while int.integer? && int > 0
    puts str
    int -= 1
  end
end

repeat('Hello',5)

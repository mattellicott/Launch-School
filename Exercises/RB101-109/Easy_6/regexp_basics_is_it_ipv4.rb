class String
  def ipv4_address?
    ipv4_regex = /\G[\d]+.[\d]+.[\d]+.[\d]+\Z/
    return false unless match?(/#{ipv4_regex}/)

    scan(/#{ipv4_regex}/).all? { |num| ('0'..'256').cover?(num) }
  end
end

puts '127.0.0.1'.ipv4_address?

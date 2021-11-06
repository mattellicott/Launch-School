HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def generate_uuid
  uuid = ''
  8.times { uuid << HEX[rand(16)] }
  uuid << '-'
  4.times { uuid << HEX[rand(16)] }
  uuid << '-'
  4.times { uuid << HEX[rand(16)] }
  uuid << '-'
  4.times { uuid << HEX[rand(16)] }
  uuid << '-'
  12.times { uuid << HEX[rand(16)] }

  uuid
end

p generate_uuid

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# Ruby checks each of the "ancestors" in the method path lookup, in order.
# You can see the order by calling the `ancestors` method on the Class.

# Orange --> Taste --> Object --> Kernel --> BasicObject
# HotSauce --> Taste --> Object --> Kernel --> BasicObject

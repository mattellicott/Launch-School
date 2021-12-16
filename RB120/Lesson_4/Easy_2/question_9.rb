class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# The `play` method defined in the `Bingo` class would override the method
# defined in the `Game` class. When calling the `play` method on a instance of
# `Bingo`, Ruby would find the method in the `Bingo` class, execute it, and stop
# looking.

# Each Player has a name, a piece, and a wins counter.
# Class knows to give first player a certain
# piece and a second player a different kind of
# piece to usein the game.
class Player
  attr_reader :piece
  
  @@player_count = 0

  def initialize
    @@player_count += 1
    @piece = "\u26AA".encode('utf-8') if @@player_count == 1
    @piece = "\u26AB".encode('utf-8') if @@player_count == 2
  end

end
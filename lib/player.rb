# Each Player has a name, a piece, and a wins counter.
# Class knows to give first player a certain
# piece and a second player a different kind of
# piece to usein the game.
class Player
  attr_reader :piece, :name
  
  @@player_count = 0

  def initialize
    @@player_count += 1
    if @@player_count == 1
      @piece = "\u263A".encode('utf-8')
      @name = 'Player One'
    elsif @@player_count == 2
      @piece = "\u263B".encode('utf-8')
      @name = 'Player Two'
    end
  end

end
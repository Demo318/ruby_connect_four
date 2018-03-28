# The play surface of the game. Its @root_space
# is used to access other BoardSpace nodes across
# the play surface.
class Board
  attr_reader :root_space

  def initialize
    @root_space = BoardSpace.new([0, 0])
  end
end

# Each individual space on the board. A BoardSpace
# node knows its own coordinates, which piece has
# landed in it, and its relation to other nodes.
class BoardSpace
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end

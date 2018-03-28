# The play surface of the game. Its @root_space
# is used to access other BoardSpace nodes across
# the play surface.
class Board
  attr_reader :root_space, :max_x_value, :max_y_value

  def initialize
    @root_space = BoardSpace.new([0, 0])
    @max_x_value = 6
    @max_y_value = 5
  end
end

# Each individual space on the board. A BoardSpace
# node knows its own coordinates, which piece has
# landed in it, and its relation to other nodes.
class BoardSpace
  attr_reader :coordinates,
              :up, :right, :down, :left

  def initialize(coordinates, up = nil, right = nil, down = nil, left = nil)
    @coordinates = coordinates
    @up = up
    @right = right
    @down = down
    @left = left
  end
end

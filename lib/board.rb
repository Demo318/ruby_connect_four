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

  public

  def create_board
    create_row(@root_space)
    space = @root_space
    loop do
      create_column(space)
      break if space.right.nil?
      space = space.right
    end
    stitch_all_columns_together(@root_space)
  end

  def draw_board
    space = @root_space
    space = space.up until space.up.nil?
    board_display = %{  0   1   2   3   4   5   6\n}
    loop do
      board_display += draw_row(space)
      break if space.down.nil?
      space = space.down
    end
    board_display += "-----------------------------"
    puts board_display
  end

  def find_space(coordinates)
    raise 'Invalid X Value' if bad_x_value?(coordinates[0])
    raise 'Invalid Y Value' if bad_y_value?(coordinates[1])
    space = @root_space
    space = space.right until space.coordinates[0] == coordinates[0]
    space = space.up until space.coordinates[1] == coordinates[1]
    space
  end

  private

  def bad_x_value?(value)
    return false if (0..@max_x_value).cover?(value)
    true
  end

  def bad_y_value?(value)
    return false if (0..@max_y_value).cover?(value)
    true
  end

  def draw_row(space)
    row_string = '| '
    loop do
      row_string += space.piece + ' |'
      break if space.right.nil?
      row_string += ' '
      space = space.right
    end
    row_string + "\n"
  end

  def stitch_all_columns_together(first_space)
    left_column_root = first_space
    right_column_root = first_space.right
    loop do
      stitch_two_columns_together(left_column_root, right_column_root)
      break if right_column_root.right.nil?
      left_column_root = right_column_root
      right_column_root = right_column_root.right
    end
  end

  def stitch_two_columns_together(left_space, right_space)
    loop do
      left_space.right = right_space
      right_space.left = left_space
      break if left_space.up.nil?
      left_space = left_space.up
      right_space = right_space.up
    end
    true
  end

  def create_column(first_space)
    space = first_space
    loop do
      break if space.coordinates[1] == @max_y_value
      space.up = BoardSpace.new([space.coordinates[0],
                                 space.coordinates[1] + 1],
                                nil, nil, space, nil)
      space = space.up
    end
  end

  def create_row(first_space)
    space = first_space
    loop do
      break if space.coordinates[0] == @max_x_value
      space.right = BoardSpace.new([space.coordinates[0] + 1,
                                    space.coordinates[1]],
                                   nil, nil, nil, space)
      space = space.right
    end
  end


end

# Each individual space on the board. A BoardSpace
# node knows its own coordinates, which piece has
# landed in it, and its relation to other nodes.
class BoardSpace
  attr_accessor :up, :right, :down, :left, :coordinates, :piece

  def initialize(coordinates, up = nil, right = nil, down = nil, left = nil)
    @coordinates = coordinates
    @up = up
    @right = right
    @down = down
    @left = left
    @piece = ' '
  end
end

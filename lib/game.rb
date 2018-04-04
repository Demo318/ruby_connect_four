require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :player_1, :player_2, :board

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def column_full?(column)
    return true if @board.find_space([column, @board.max_y_value]).piece != ' '
    false
  end

  def pick_drop(player)
    column = gets.chomp.to_i
    puts 'Great choice!'
    space = @board.find_space([column, @board.max_y_value])
    space = space.down until space.down.nil? || space.down.piece != ' '
    space.piece = player.piece
    true
  end

end

player_one = Player.new
player_two = Player.new
board = Board.new
board.create_board
connect_four = Game.new(player_one, player_two, board)

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
    if @board.find_space([column, @board.max_y_value]).piece != ' '
      return true
    end
    false
  end

end

player_one = Player.new
player_two = Player.new
board = Board.new
board.create_board
connect_four = Game.new(player_one, player_two, board)

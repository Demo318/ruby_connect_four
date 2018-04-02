require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'ui.rb'

class Game

  attr_reader :player_1, :player_2, :board

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def get_player_names

    
  end

  def number_of_players(input = $stdin, output = $stdout)
    user_interface = UI.new
    user_interface.give('How many people would like to play?', output)
    number = user_interface.receive(input)
    # puts 'Human vs. Computer' if number == 1
    number
  end

end

connect_four = Game.new(Player.new, Player.new, Board.new)

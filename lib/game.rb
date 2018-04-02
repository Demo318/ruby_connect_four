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

  def number_of_players
    puts 'How many people would like to play?'
    number = gets.chomp.to_i
    puts 'Human vs. Computer' if number == 1
    # return number
  end

end

connect_four = Game.new(Player.new, Player.new, Board.new)

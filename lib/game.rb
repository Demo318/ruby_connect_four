require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'end_game.rb'

class Game
  attr_reader :player_1, :player_2, :board, :last_drop
  include EndGame

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def column_full?(column)
    return true if @board.find_space([column, @board.max_y_value]).piece != ' '
    false
  end

  def take_turn(player)
    loop do
      @last_drop = pick_drop(player)
      break if @last_drop.class == BoardSpace
    end
  end

  def pick_drop(player)
    puts 'Where would you like to drop your next piece?'
    column = gets.chomp
    if not_a_single_number?(column)
      puts 'Please enter a single digit.'
      return false
    elsif invalid_column?(column.to_i)
      puts 'That is not a valid column.'
      return false
    elsif column_full?(column.to_i)
      puts 'That column is full.'
      return false
    end
    space = place_piece(column.to_i, player)
    puts 'Great choice!'
    space
  end

  private

  def not_a_single_number?(entry)
    return true if entry.length > 1 || entry.empty? || (/[0-9]/ =~ entry) != 0
    false
  end

  def invalid_column?(column_number)
    return false if (0..@board.max_x_value).cover?(column_number)
    true
  end

  def place_piece(column, player)
    space = @board.find_space([column, @board.max_y_value])
    space = space.down until space.down.nil? || space.down.piece != ' '
    space.piece = player.piece
    space
  end

end

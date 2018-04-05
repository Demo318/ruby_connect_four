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

  def take_turn(player)
    loop do
      done = pick_drop(player)
      break if done == true
    end
  end

  def pick_drop(player)
    puts 'Where would you like to drop your next piece?'
    column = gets.chomp.to_i
    if invalid_column?(column)
      puts 'That is not a valid column.'
      return false
    elsif column_full?(column)
      puts 'That column is full.'
      return false
    end
    place_piece(column, player)
    puts 'Great choice!'
    true
  end

  private

  def invalid_column?(column_number)
    return false if (0..@board.max_x_value).cover?(column_number)
    true
  end

  def place_piece(column, player)
    space = @board.find_space([column, @board.max_y_value])
    space = space.down until space.down.nil? || space.down.piece != ' '
    space.piece = player.piece
  end

end

# To run test suite, comment out below lines and run 'bundle exec rspec'

# player_one = Player.new
# player_two = Player.new
# board = Board.new
# board.create_board
# connect_four = Game.new(player_one, player_two, board)

# puts "Welcome message goes here."
# current_player = connect_four.player_1
# next_player = connect_four.player_2
# loop do
#   connect_four.board.draw_board
#   puts "#{current_player.name}, it is your turn."
#   connect_four.take_turn(current_player)
#   current_player, next_player = next_player, current_player
# end


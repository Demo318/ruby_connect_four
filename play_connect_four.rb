require_relative 'lib/game.rb'

player_one = Player.new
player_two = Player.new
board = Board.new
board.create_board
connect_four = Game.new(player_one, player_two, board)

puts "Welcome message goes here."
current_player = connect_four.player_1
next_player = connect_four.player_2
loop do
  connect_four.board.draw_board
  puts "#{current_player.name}, it is your turn."
  connect_four.take_turn(current_player)
  current_player, next_player = next_player, current_player
end

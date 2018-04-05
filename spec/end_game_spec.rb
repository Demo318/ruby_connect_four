require 'rspec'

require_relative '../lib/end_game.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class EndGameTester
  include EndGame
end

describe EndGame do

  let(:end_game_tester) { EndGameTester.new }
  Player.class_variable_set(:@@player_count, 0)
  player_one = Player.new
  player_two = Player.new
  game_board = Board.new
  game_board.create_board
  let(:game) { Game.new(player_one, player_two, game_board) }

  describe '.horizontal_win?' do
    context 'when passed a newly-placed piece & board with winning circumstance' do
      before do
        (1..4).each do |x|
          game.board.find_space([x, 0]).piece = game.player_1.piece
        end
        @piece = game.board.find_space([2, 0])
      end
      it { expect(end_game_tester.horizontal_win?(@piece, game.board)).to be_true }
    end
  end

end
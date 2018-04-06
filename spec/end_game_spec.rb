require 'rspec'
require_relative 'spec_helper.rb'

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
    context 'when passed a newly-placed piece & board with horizontal winning circumstance' do
      before do
        (1..4).each do |x|
          game.board.find_space([x, 0]).piece = game.player_1.piece
        end
        @space = game.board.find_space([2, 0])
      end
      it { expect(end_game_tester.horizontal_win?(@space)).to be(true) }
    end
  end

  describe '.verticle_win?' do
    context 'when passed a newly-placed piece & board with verticle winning circumstance' do
      before do
        (1..4).each do |y|
          game.board.find_space([0, y]).piece = game.player_2.piece
        end
        @space = game.board.find_space([0, 2])
      end
      it { expect(end_game_tester.verticle_win?(@space)).to be(true) }
    end
  end

  describe '.diagonal_win?' do
    context 'when passed a newly-placed piece & board with bottom-to-top diagonal win' do
      before do
        (1..4).each do |num|
          game.board.find_space([num, num]).piece = game.player_1.piece
        end
        @space = game.board.find_space([2, 2])
      end
      it { expect(end_game_tester.diagonal_win?(@space)).to be(true) }
    end
    context 'when passed a newly-placed piece & board with top-to-bottom diagonal win' do
      before do
        (1..4).each do |num|
          game.board.find_space([num, 4 - num]).piece = game.player_2.piece
        end
        @space = game.board.find_space([2, 2])
      end
      it { expect(end_game_tester.diagonal_win?(@space)).to be(true) }
    end
  end
end

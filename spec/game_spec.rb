require 'rspec'
require_relative 'spec_helper.rb'

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Game do
  Player.class_variable_set(:@@player_count, 0)
  player_one = Player.new
  player_two = Player.new
  game_board = Board.new
  game_board.create_board
  let(:game) { Game.new(player_one, player_two, game_board) }

  describe '.initialize' do
    it 'has two players and a board' do
      expect(game.player_1.class.to_s).to eq('Player')
      expect(game.player_2.class.to_s).to eq('Player')
      expect(game.board.class.to_s).to eq('Board')
    end
  end

  before do
    (0..game.board.max_y_value).each do |y|
      game.board.find_space([1, y]).piece = game.player_1.piece
    end
  end
  describe '#column_full?' do
    context 'when column is not full' do
      it { expect(game.column_full?(0)).to be(false) }
    end
    context 'when column is full' do
      it { expect(game.column_full?(1)).to be(true) }
    end
  end

  describe '#pick_drop' do
    before do
      @game = game
    end
    context 'when passed a valid column number' do
      it 'returns true and displays message' do
        allow(@game).to receive(:gets).and_return("2\n")
        expect do
          expect(@game.pick_drop(game.player_1)).to be_instance_of(BoardSpace)
        end.to output("Where would you like to drop your next piece?\nGreat choice!\n").to_stdout

        expect(@game.board.find_space([2, 0]).piece).to eq(@game.player_1.piece)
      end
      it 'stacks piece on top of previous pieces' do
        allow(@game).to receive(:gets).and_return("2\n")
        expect do
          expect(@game.pick_drop(game.player_2)).to be_instance_of(BoardSpace)
        end.to output("Where would you like to drop your next piece?\nGreat choice!\n").to_stdout

        expect(@game.board.find_space([2, 1]).piece).to eq(@game.player_2.piece)
      end

      it 'does not let player stack onto full column' do
        allow(@game).to receive(:gets).and_return("1\n")

        expect do
          expect(@game.pick_drop(game.player_1)).to be(false)
        end.to output("Where would you like to drop your next piece?\nThat column is full.\n").to_stdout
      end
    end

    context 'when user enters column number outside the range' do
      it 'does not let player attempt move' do
        allow(@game).to receive(:gets).and_return("#{@game.board.max_x_value + 1}\n")

        expect do
          expect(@game.pick_drop(game.player_1)).to be(false)
        end.to output("Where would you like to drop your next piece?\nThat is not a valid column.\n").to_stdout
      end
    end

    context 'when user enters a non-digit' do
      it 'does not let player attempt move for letter' do
        allow(@game).to receive(:gets).and_return("a\n")

        expect do
          expect(@game.pick_drop(game.player_1)).to be(false)
        end.to output("Where would you like to drop your next piece?\nPlease enter a single digit.\n").to_stdout
      end
      it 'does not let player attempt move for punctuation' do
        allow(@game).to receive(:gets).and_return(";\n")

        expect do
          expect(@game.pick_drop(game.player_1)).to be(false)
        end.to output("Where would you like to drop your next piece?\nPlease enter a single digit.\n").to_stdout
      end
    end
  end
end

require 'rspec'

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Game do
  Player.class_variable_set(:@@player_count, 0)
  let(:game) { Game.new(Player.new, Player.new, Board.new) }

  describe '.initialize' do
    it 'has two players and a board' do
      expect(game.player_1.class.to_s).to eq('Player')
      expect(game.player_2.class.to_s).to eq('Player')
      expect(game.board.class.to_s).to eq('Board')
    end
  end

  before do
    game.board.create_board
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
          expect(@game.pick_drop(game.player_1)).to be(true)
        end.to output("Great choice!\n").to_stdout
        expect(@game.board.find_space([2, 0]).piece).to eq(@game.player_1.piece)
      end
      it 'stacks piece on top of previous pieces' do
        allow(@game).to receive(:gets).and_return("2\n")
        expect do
          expect(@game.pick_drop(game.player_2)).to be(true)
        end.to output("Great choice!\n").to_stdout
        expect(@game.board.find_space([2, 1]).piece).to eq(@game.player_2.piece)
        puts @game.board.draw_board
      end
    end
  end


end

require 'rspec'

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Game do
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


end

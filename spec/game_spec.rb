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

  describe '#get_player_names' do
    it { expect(game).to respond_to(:get_player_names) }
  end

  describe '#number_of_players' do
    it 'can choose one player' do
      allow(game).to receive(:gets).and_return('1')
      expect { expect(game.number_of_players).to eq(1) }.to output("How many people would like to play?\nHuman vs. Computer\n").to_stdout
    end
  end
end

require 'rspec'

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Game do
  describe '.initialize' do
    before do
      @game = Game.new(Player.new, Player.new, Board.new)
    end

    it 'has two players and a board' do
      expect(@game.player_1.class.to_s).to eq('Player')
      expect(@game.player_2.class.to_s).to eq('Player')
      expect(@game.board.class.to_s).to eq('Board')
    end
  end

  describe '#get_player_names' do
    game = Game.new(Player.new, Player.new, Board.new)
    it { expect(game).to respond_to(:get_player_names) }
  end

  # describe '#number_of_players' do
  #   game = Game.new(Player.new, Player.new, Board.new)
  #   it { expect(game).to respond_to(:number_of_players) }
  #   it "confirms Human vs. Computer" do
  #     allow(STDIN).to receive("1\n")
  #     expect(STDOUT).to receive(:puts).with('How many people would like to play?')
  #     expect(STDOUT).to receive(:puts).with('Human vs. Computer')
      
  #     game.number_of_players
  #  end
  # end
end

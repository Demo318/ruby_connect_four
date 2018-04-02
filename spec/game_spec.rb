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

  describe '#number_of_players' do
    @input = StringIO.new('1')
    @output = StringIO.new
    game = Game.new(Player.new, Player.new, Board.new)
    it { expect(game).to respond_to(:number_of_players) }

    it { expect(game.number_of_players(@input, @output)).to eq(@input) }
    it { expect(@output.read).to eq('How many people would like to play?') }
  end
end

require 'rspec'

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Game do
  context '.initialize' do
    before do
      @game = Game.new(Player.new, Player.new, Board.new)
    end

    it 'has two players and a board' do
      expect(@game.player_1.class.to_s).to eq('Player')
      expect(@game.player_2.class.to_s).to eq('Player')
      expect(@game.board.class.to_s).to eq('Board')
    end
  end
end

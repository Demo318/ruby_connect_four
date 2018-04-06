require 'rspec'
require_relative 'spec_helper.rb'

require_relative '../lib/player.rb'
describe Player do

  it 'has reset @@player_count to 0' do
    Player.class_variable_set(:@@player_count, 0)
    expect(Player.class_variable_get(:@@player_count)).to eq(0)
  end

  describe '.initialize' do
    let(:player_one) { Player.new }
    let(:player_two) { Player.new }
    context 'when initializing the first player' do
      it 'gets white piece and name "Player One"' do
        expect(player_one.piece).to eq('☺')
        expect(player_one.name).to eq('Player One')
      end
    end
    context 'when initializing the second player' do
      it 'gets black piece and name "Player Two"' do 
        expect(player_two.piece).to eq('☻')
        expect(player_two.name).to eq('Player Two')
      end
    end
  end
end

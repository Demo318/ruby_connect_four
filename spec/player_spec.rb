require 'rspec'

require_relative '../lib/player.rb'

describe Player do
  it 'can reset @@player_count to 0' do
    Player.class_variable_set(:@@player_count, 0)
    expect(Player.class_variable_get(:@@player_count)). to eq(0)
  end

  describe '.initialize' do
    let(:player_one) { Player.new }
    let(:player_two) { Player.new }
    context 'when initializing the first player' do
      it { expect(player_one.piece).to eq('⚪') }
    end
    context 'when initializing the second player' do
      it { expect(player_two.piece).to eq('⚫') }
    end

  end


end

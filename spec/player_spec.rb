require 'rspec'

require_relative '../lib/player.rb'

describe Player do

  describe '.initialize' do
    @player_one = Player.new
    @player_two = Player.new
    puts @player_one.show_player_count

    it { expect(@player_one.show_player_count).to eq(2) }
  end


end

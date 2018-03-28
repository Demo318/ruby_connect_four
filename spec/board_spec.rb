require 'rspec'

require_relative '../lib/board.rb'

describe Board do
  context '.initialize' do
    before { @board = Board.new }
    it 'should have the following parameters' do
      expect(@board.root_space.class.to_s).to eq('BoardSpace')
      expect(@board.root_space.coordinates).to eq([0, 0])
    end
  end
end

describe BoardSpace do
  context '.initialize' do
    before { @space = BoardSpace.new([0, 0]) }
    it 'should initialize with the following parameters' do
      expect(@space.coordinates.class.to_s).to eq('Array')
    end
  end

end

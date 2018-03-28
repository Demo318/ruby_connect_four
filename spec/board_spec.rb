require 'rspec'

require_relative '../lib/board.rb'

describe Board do
  describe '.initialize' do
    before { @board = Board.new }
    it 'creates @root_node as BoardSpace object' do
      expect(@board.root_space.class.to_s).to eq('BoardSpace')
      expect(@board.root_space.coordinates).to eq([0, 0])
    end
    it { expect(@board.max_x_value).to eq(6) }
    it { expect(@board.max_y_value).to eq(5) }
  end
end

describe BoardSpace do
  describe '.initialize' do
    context 'when passed coordinates as array' do
      before { @space_one = BoardSpace.new([0, 0]) }
      it { expect(@space_one.coordinates.class.to_s).to eq('Array') }
      it { expect(@space_one.coordinates).to eq([0, 0]) }
    end

    context 'when passed no relational nodes' do
      before { @space_one = BoardSpace.new([4, 4])}
      it { expect(@space_one.up).to be_nil }
      it { expect(@space_one.right).to be_nil }
      it { expect(@space_one.down).to be_nil }
      it { expect(@space_one.left).to be_nil }
    end

    context 'when passed an up relational node' do
      before do
        @space_one = BoardSpace.new([4, 4])
        @space_two = BoardSpace.new([4, 5], up = @space_one)
      end
      it { expect(@space_two.up).to eq(@space_one)}
    end

    context 'when passed a right relational node' do
      before do
        @space_one = BoardSpace.new([4, 4])
        @space_two = BoardSpace.new([5, 4], nil, @space_one)
      end
      it { expect(@space_two.right).to eq(@space_one) }
    end

    context 'when passed a down relational node' do
      before do
        @space_one = BoardSpace.new([4, 4])
        @space_two = BoardSpace.new([4, 3], nil, nil, @space_one, nil)
      end
      it { expect(@space_two.down).to eq(@space_one) }
    end

    context 'when passed a leftrelational node' do
      before do
        @space_one = BoardSpace.new([4, 4])
        @space_two = BoardSpace.new([3, 4], nil, nil, nil, @space_one)
      end
      it { expect(@space_two.left).to eq(@space_one) }
    end
  end

end

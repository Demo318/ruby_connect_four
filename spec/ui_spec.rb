require 'rspec'

require_relative '../lib/ui.rb'

describe UI do
  before(:each) do
    @ui = UI.new
    @input = StringIO.new("test info\n")
    @output = StringIO.new
    @input_received = @ui.receive(@input)
    @ui.give('test message', @output)
  end
  it 'should output a message for the user' do
    expect(@output.string).to eq("test message\n")
  end
  it 'should return the user\'s input' do
    expect(@input_received).to eq('test info')
  end
end

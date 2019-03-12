#require 'TicTacToe'
#require 'Player'
require 'Board'


describe Board do
  before do
    @board1 = Board.new
    @board1.board = [['X','X','X'],[4,5,6],[7,8,9]]
  end

  describe '#win_check' do

    context "given a result of three equal characters in a row" do
    it "given XXX in the top row" do
      expect(@board1.win_check).to eq(true)
    end
    end
  end

  describe '#valid_input' do
    context "checks to see if user input is valid" do
      it "returns true if given a valie of 4" do
        expect(@board1.valid_input(4)).to eq(true)
      end
    end


  end
end

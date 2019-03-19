require 'rspec'
require_relative '../lib/ConnectFourPlayer.rb'

describe ConnectFourPlayer do

  describe '#initialize' do
    let(:player1) { Player.new }
    let(:player2) { Player.new }

    context 'when initializing player1' do
      it 'sets the piece for the first player' do
        expect(player1.piece).to eq('B')
    end

    context 'when initializing player2' do
      it 'sets the piece for the second player' do
        expect(player2.piece).to eq('R')
      end
    end
  end

  describe '#get_piece' do
    it 'returns the character used for the player piece'
    expect(player1.get_piece).to eq("B")
  end

end

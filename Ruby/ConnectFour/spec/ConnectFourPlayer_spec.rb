require 'rspec'
require_relative '../lib/ConnectFourPlayer.rb'

describe ConnectFourPlayer do

  describe '#initialize' do
    let(:player1) { ConnectFourPlayer.new('B') }
    let(:player2) { ConnectFourPlayer.new('R') }
    context 'when initializing player1' do
      it 'sets the piece for the first player' do
        expect(player1.piece).to eq('B')
      end
    end

    context 'when initializing player2' do
      it 'sets the piece for the second player' do
        expect(player2.piece).to eq('R')
      end
    end
  end

  describe '#get_piece' do
    let(:player1) { ConnectFourPlayer.new('B') }
    it 'returns the character used for the player piece' do
      expect(player1.piece).to eq('B')
    end
  end
end

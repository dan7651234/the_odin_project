require 'ConnectFour'

describe ConnectFour do
    let (:game1) {ConnectFour.new}
    describe '#initialize' do
      context 'when a new ConnectFour game object is created' do

        it 'creates a new board' do
          expect(game1.board.rows).to eq(6)
        end

        it 'creates two new players' do
          expect(game1.player1.piece).to eq("B")
          expect(game1.player2.piece).to eq("R")
        end

        it 'starts the game' do
          expect(subject).to receive(:start_game)
          subject.start_game
        end
      end
    end

  describe '#start_game' do
    context 'when starting the game' do
        it 'sets the active player' do
          expect(game1.activePlayer).to eq(game1.player1)
        end

        it 'executes a turn' do
          expect(subject).to receive(:turn)
          subject.turn
        end

      end
    #sets the active player
    #initiates the a turn
    #runs until game ends
  end

  describe '#turn' do
    #gets player input
    #passes input to board
    #checks if game is over
    context 'when a player takes their turn' do
      it 'checks if the game is over' do

      end
    end


  end

  describe '#get_player_input' do
    #asks for player input
    #saves
    context 'when a player action is required during a turn' do
      it 'prompts the player for input' do

      end

      it 'validates the input by running the #valid_move method' do

      end

      it 'saves the player input' do

      end
    end


  end

  describe '#switch_active_player' do
    #sets the active player to the next player
    it 'switches the active player to the non-active player' do
      game1.activePlayer = game1.player1
      game1.switch_active_player
      expect(game1.activePlayer).to eq(game1.player2)
    end

  end

  describe '#game_over' do
    #checks if board has 4 in a row
    #checks if there are no more available spaces on the board
  end



end

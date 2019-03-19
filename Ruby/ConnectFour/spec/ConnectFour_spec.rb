require 'ConnectFour'

describe ConnectFour do
  @activePlayer = ConnectFourPlayer.new

  describe '#start_game' do
    #create players
    #create board
    #returns nothing
    #initiates first turn
  end

  describe '#turn' do
    #gets player input
    #passes input to board
    #checks if game is over
    #continues until game over conditions are met
  end

  describe '#get_player_input' do
    #asks for player input
    #saves
  end

  describe '#switch_active_player' do
    #sets the active player to the next player
    it 'switches the active player to the non-active player' do
      expect(switch_active_player).not_to eq(@activePlayer)
    end

  end

  describe '#game_over' do
    #checks if board has 4 in a row
    #checks if there are no more available spaces on the board
  end



end

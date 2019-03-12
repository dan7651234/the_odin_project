=begin
Build a tictactoe game.
Objects: Board, Player
Board Attributes: Nine spaces (3x3 grid)
Board Actions:
Should be able to accept a player move by placing an X or O on the board in a spot designated by the player.
Should be able to regenerate if the players want to play again.
Should be able to check if either 3 X's or 3 O's are in a row causing a player to win.
Should be able to determine if the game ends in a tie.

Player Attributes: Should be assigned an X or O automatically by the program. THere should only be two instances of the player object.
Player Actions:
Player should be able to play their shape and select which square it should go in on the board.
Player should be able to choose to play again.
=end

class Board
  attr_accessor(:board, :lastLocation)

  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
    @lastLocation = 0
  end

  def display
    @board.each {|row| p row}
  end

  def valid_input(location)
    if location.class == Fixnum && location >= 0 && location < 10
      if @board[location/3][location%3].class == Fixnum
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def update(piece, location)
      @board[location/3][location%3] = piece
  end

  def win_check
    @board.each do |x|
      if x[0] == x[1] && x[0] == x[2]
        return true
      end
    end
    count = 0
    track = 0
    while track < 3
      if @board[count][track] == @board[count + 1][track] && @board[count][track] == @board[count + 2][track]
        return true
      else
        track += 1
      end
    end
    return false
  end

end

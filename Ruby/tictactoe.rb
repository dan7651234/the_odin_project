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

  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def display
    @board.each {|row| p row}
  end

  def play(location)
end

myBoard = Board.new
myBoard.display


class Player
  def initialize(piece)
    @piece = piece
  end

  def play(location)

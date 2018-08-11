class Board
  attr_accessor :board

  def initialize
    @board = []
    for i in 1..8
      row = []
      for i in 1..8
        row << "X"
      end
      @board << row
    end
  end

  def print_board
    @board.each { |x| p x  }
    p ""
  end

  def set_char(row, col, char)
    @board[row-1][col-1] = char
  end

end


newBoard = Board.new
newBoard.print_board
newBoard.set_char(4,2,"O")
newBoard.print_board

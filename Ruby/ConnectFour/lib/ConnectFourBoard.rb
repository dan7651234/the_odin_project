class ConnectFourBoard
  attr_accessor :rows, :columns, :gameboard

  def initialize
    @rows = 6
    @columns = 7
    @gameboard = createBoard
  end

  def createBoard
    result = []
    i = 0
    while i < rows
      makeRow = []
      j = 0
      while j < columns
        makeRow << '-'
        j = j + 1
      end
      i = i + 1
      result << makeRow
    end
    return result
  end

  def displayBoard
    p [1..@columns]
    @gameboard.reverse.each {|row| p row}
  end

  def get_column_height(column)
    height = 0
    until @gameboard[i][column] == "-" && height <= rows
      height = height + 1
    end
    return height
  end

  def dropPiece(drop, piece)
    drop = drop - 1
    i = 0
    while i <= rows
      if @gameboard[i][drop] == "-"
        @gameboard[i][drop] = piece
        return true
      elsif i == rows && @gameboard[i][drop] != "-"
        return false
      else
        i = i + 1
      end
    end
  end
end

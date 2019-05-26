require 'ConnectFourBoard'
require 'ConnectFourPlayer'

class ConnectFour
  attr_accessor :board, :player1, :player2, :activePlayer, :gameOver
  @@count = 0


  def initialize
    @board = ConnectFourBoard.new
    @player1 = ConnectFourPlayer.new("B", "Player 1")
    @player2 = ConnectFourPlayer.new("R", "Player 2")
    @@count = @@count + 1
    @gameOver = false

    start_game
  end

  def start_game
    @activePlayer = player1
    until @gameOver
      turn
    end
    "Congratulations! #{@activePlayer} is the winner!"
  end

  def turn
    @board.displayBoard
    p (1..@board.columns)
    answer = get_player_input
    until @board.dropPiece(answer, @activePlayer.piece)
      puts "Column #{answer} is full! Please select another column: "
      answer = get_player_input
    end
    if win_check == true
      @gameOver = true
    else
      switch_active_player
    end

  end

  def switch_active_player
    if @activePlayer == @player1
      @activePlayer = @player2
    else
      @activePlayer = @player1
    end
  end

  def get_player_input
    puts "#{@activePlayer.name}, which column will you drop your piece in?"
    answer = $stdin.gets.to_i

    until (1..@board.columns).include? answer
      puts "Invalid selection. Please choose a number from 1 to " + @board.columns.to_s
      answer = $stdin.gets.chomp.to_i
    end
    return answer
  end

  def win_check
    row_check = 0
    col_check = 0
    resultPlayer1 = 0
    resultPlayer2 = 0
    while row_check < @board.rows
      if @board[]
  end

end

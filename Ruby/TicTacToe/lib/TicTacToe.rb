require 'Board.rb'
require 'Player.rb'

myBoard = Board.new
player1 = Player.new("X")
player2 = Player.new("O")
lastPlayer = 0

turn = -1
while myBoard.win_check != true
  myBoard.display
  puts player1.play
  puts player2.play
  puts "Player 1, where do you want to play?"
  turn = gets.chomp
  turn = turn.to_i
  while myBoard.valid_input(turn-1) == false
    puts "Invalid Input, please enter a number that isn't taken"
    turn = gets.chomp
    turn = turn.to_i
  end
  myBoard.update(player1.play, turn - 1)
  lastPlayer = 1
  myBoard.display
  puts myBoard.win_check
  if myBoard.win_check != true
    puts "Player 2, where do you want to play?"
    turn = gets.chomp
    turn = turn.to_i
    while myBoard.valid_input(turn-1) == false
      puts "Invalid Input, please enter a number that isn't taken"
      turn = gets.chomp
      turn = turn.to_i
    end
    myBoard.update(player2.play, turn - 1)
    myBoard.display
    lastPlayer = 2
  end
end

puts "Player " + lastPlayer.to_s + " wins!"

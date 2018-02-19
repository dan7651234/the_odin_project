require './MastermindPlayer.rb'

player1 = Player.new("Codebreaker","Human")
player2 = Player.new("Codemaker", "Computer")
games = 1

while games % 2 != 0
  puts "How many games would you like to play? (Even number only)"
  games = gets.chomp
  games = games.to_i
end

code = []
puts player1.getType()

if player1.getController() == "Human"
  code = player2.generateCode(["B","W","R","G","P","Y"])
end

gameOver = false
win = ["B","B","B","B"]

guesses = 0
while gameOver != true
  puts code.to_s
  puts "Enter your guess: "
  guess = gets.chomp
  parsedGuess = guess.split("")
  if player2.feedback(parsedGuess,code) != win #where should the feedback method sit?
    puts "Guess is " + parsedGuess.to_s
    puts "Feedback is " + player2.feedback(parsedGuess,code).to_s
    guesses = guesses + 1
  else
    gameOver = true
    player2.score(guesses)
  end
end

puts "Final score"
if player1.getScore > player2.getScore
  puts "Player 1: " + player1.getScore
  puts "Player 2: " + player2.getScore
  puts "Player 1 WINS!"
elsif player2.getScore > player1.getScore
  puts "Player 2: " + player2.getScore
  puts "Player 1: " + player1.getScore
  puts "Player 2 WINS!"
else
  puts "Player 1: " + player1.getScore
  puts "Player 2: " + player2.getScore
  puts "A tie? Seriously?"
end

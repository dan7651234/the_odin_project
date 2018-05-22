require './MastermindPlayer.rb'

player1 = Player.new("Codebreaker","Human")
player2 = Player.new("Codemaker", "Computer")
games = 1
gamesPlayed = 0
win = ["B","B","B","B"]

def humanGuesser(code, player1, player2, win)
  gameOver = false
  guesses = 0
  while gameOver != true && guesses < 12
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
      player2.score(12 - guesses)
    end
  end
end

def computerGuesser(code, player1, player2, win)
  pastGuesses = []
  currentGuess = []
  lastFeedback = []
  gameOver = false
  guesses = 0
  while gameOver!=true && guesses < 12
    puts code.to_s
    currentGuess = player2.computerGuess(lastFeedback)
    if player1.feedback(currentGuess,code) != win
      puts "Guess is " + currentGuess.to_s
      puts "Feedback is " + player1.feedback(currentGuess,code).to_s
      guesses = guesses + 1
    else
      gameOver = true
      player1.score(12-guesses)
    end
  end
end

while games % 2 != 0
  puts "How many games would you like to play? (Even number only)"
  games = gets.chomp
  games = games.to_i
end

while gamesPlayed < games

  code = []
  puts player1.getType()

  if player1.getController() == "Human" && player1.getType == "Codebreaker"
    code = player2.generateCode(["B","W","R","G","P","Y"])
    humanGuesser(code, player1, player2, win)
  elsif player1.getController() == "Human" && player1.getType == "Codemaker"
    puts "Enter the code to be broken: "
    code = gets.chomp.split("")
    puts code
    computerGuesser(code,player1,player2,win)
  end

  gamesPlayed = gamesPlayed + 1
  player1.switch
  player2.switch
  puts "Player 1 score: " + player1.getScore.to_s
  puts "Player 2 score: " + player2.getScore.to_s
  puts ""
end

puts "Final score"
if player1.getScore > player2.getScore
  puts "Player 1: " + player1.getScore.to_s
  puts "Player 2: " + player2.getScore.to_s
  puts "Player 1 WINS!"
elsif player2.getScore > player1.getScore
  puts "Player 2: " + player2.getScore.to_s
  puts "Player 1: " + player1.getScore.to_s
  puts "Player 2 WINS!"
else
  puts "Player 1: " + player1.getScore.to_s
  puts "Player 2: " + player2.getScore.to_s
  puts "A tie? Seriously?"
end

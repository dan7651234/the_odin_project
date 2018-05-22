=begin
start game
  load the dictionary - COMPLETE
  consider only items >=5 and <=12 COMPLETE
  randomly select a word and make it all lower case COMPLETE
  set the max number of allowable guesses COMPLETE
play the game
  display the "board" - COMPLETE
  prompt the player for a guess and make sure it's a lowercase letter - COMPLETE
  check to see if the word contains the letter - COMPLETE
  if it doesn't, decrement remaining guesses - COMPLETE
  if it does, update the displayable string to show where in the word the players letter falls - COMPLETE
  repeat until game is won / lost - COMPLETE
save the game
  look up how serialization plays into this
  add functionality to the beginning of each round asking if the player wants to save the game
  add functionality to the start game to allow the player to load the last game
=end

require 'yaml'

class Hangman

  def initialize(startGame)
    @wordChoice = startGame
    @wordChoiceArray = @wordChoice.split("")
    @remainingGuesses = setMaxGuesses
    @result = []
    @wordChoiceArray.each {|letter| @result.push("-")}
    playGame
  end

  def setMaxGuesses
    validInput = false
    maxGuesses = 0
    while validInput == false
      puts "How many guesses would you like this game? Choose from 1 to 25"
      maxGuesses = gets.chomp.to_i
      if (1..25).include? maxGuesses
        validInput = true
      else
        puts "Invalid input, try again. Choose a number from 1 to 25"
      end
    end
    maxGuesses
  end

  def getWordChoice
    @wordChoice
  end

  def conSavQuit(choice)
    if choice == "c"
      return false
    elsif choice == "s"
      saveGame
      puts "Your game has been saved successfully! See you later!"
      return true
    elsif choice == "q"
      puts "Thanks for playing! Good bye!"
      return true
    else
      puts "Please enter a valid option. [C]ontinue, [S]ave, or [Q]uit : "
      choice = gets.chomp
      conSavQuit(choice.downcase)
    end
  end

  def saveGame
    Dir.mkdir("saved_games") unless Dir.exists?("saved_games")
    yaml = YAML::dump(self)
    filename = ""
    until filename.length > 0 && ! File.exists?(filename + ".yaml")
      #puts "Please enter a unique name for this saved game file: "
      filename = "previousGame"
    end
    filename = "./saved_games/" + filename + ".yaml"
    File.open(filename,"w") {|file| file.puts yaml}
    puts YAML::load(self.to_s)
  end

  def enterGuess
    guess = ""
    while !guess[/[a-zA-Z]+/]
      puts "Enter your guess: "
      guess = gets.chomp
      guess.downcase!
    end
    return guess
  end

  def playGame
    #puts wordChoice
    gameOver = false
    #puts result.length
    #puts wordChoiceArray.length
    while gameOver == false
      puts "[C]ontinue, [S]ave, or [Q]uit"
      turnChoice = gets.chomp
      gameOver = conSavQuit(turnChoice.downcase)
      break if gameOver == true
      puts @result.join
      puts "Guesses Remaining: #{@remainingGuesses}"
      guess = enterGuess

      if @wordChoiceArray.include? guess
        @wordChoiceArray.each_index do |i|
          if @wordChoiceArray[i] == guess
            @result[i] = @wordChoiceArray[i]
            if !@result.include? "-"
              gameOver = true
              puts @result.join
              puts "Congratulations! You win!"
            end
          end
        end
      else
        @remainingGuesses = @remainingGuesses - 1
        if @remainingGuesses == 0
          gameOver = true
          puts "Sorry, you've run out of guesses"
          puts "Correct answer: #{@wordChoice}"
        end
      end
    end
  end
end

def loadGame
  puts "Choose a game to load: "
  #files = Dir.foreach(dir).select {|x| File.file?("#{dir}/#{x}")}
  #puts files
  previousGame = File.read("./saved_games/previousGame.yaml")
  gameToLoad = YAML::load(previousGame)
  gameToLoad.playGame
end

def startGame
  newLoad = ""
  puts "[N]ew Game"
  puts "[L]oad Game"
  newLoad = gets.chomp
  newLoad.downcase!
  if newLoad == "n"
    wordOptions = File.readlines('5desk.txt')
    validWord = false
    wordChoice = ""
    while validWord == false
      wordChoice = wordOptions.sample
      if wordChoice.length >= 5 && wordChoice.length <= 12
        validWord = true
      end
    end
    #puts wordChoice
    Hangman.new(wordChoice.downcase.strip)
  elsif newLoad == "l"
    loadGame
  else
    puts "Enter a valid choice N or L only."
  end
end

startGame

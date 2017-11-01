=begin
take input that creates a dictionary (an array of words.)
1. Count the number of times the defined word appears in the dictionary.
1a. Display the result as {"word" => count}
2. Count the number of times the defined words in a phrase appears in the dictionary.
2a. Display the result as {"word1" => count, "word2" => count, "word3" => count...}
=end

puts "Enter a word, phrase, or sentence: "
dicInput = gets.chomp
dicSplit = dicInput.downcase.split(/\W/)
puts "Dictionary created: " + dicSplit.to_s

puts "Enter a search word / phrase: "
searchInput = gets.chomp
puts "Searching for " + searchInput + " in dictionary."

def substrings(search, list)
  result = Hash.new(0)
  searchParam = search.split(" ")

  wordCount = 0
  searchParam.each do |searchWord|
    list.each do |dicWord|
      if searchWord == dicWord
        wordCount += 1
      end
    end
    result[searchWord] = wordCount
    wordCount = 0
  end
  return result
end

puts substrings(searchInput, dicSplit)

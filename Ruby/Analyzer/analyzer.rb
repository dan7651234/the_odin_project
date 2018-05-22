=begin
text = ''
line_count = 0

File.open("text.txt").each do |line|
  line_count += 1
  text << line
end
=end

#Read the source file
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

#count all characters
total_characters = text.length
#count all characters excluding spaces
total_characters_no_spaces = text.gsub(/\s+/,'').length
#count all words
word_count = text.split.length

#count sentences split by punctuation
sentence_count = text.split(/\.|\?|!/).length

#count paragraphs split by multiple new lines
paragraph_count = text.split(/\n\n/).length

#creates an array of words as divided by a space
stop_words = %w{the a by on for of are with just but and to the my I has some in}

#creates an array of all words in the text
words = text.scan(/\w+/)

#creates an array of key words (those not in the stop words array)
key_words = words.select {|word| !stop_words.include?(word)}

#creates an array of sentences and removes excess white space in the middle as well as at the very beginning and end
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
#sorts the sentences array by length of the sentences then carves out the middle third and saves it to a new array to be printed as a summary.
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} characters exclusing spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{((key_words.length.to_f / words.length.to_f) * 100).to_i}% key words to total words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"

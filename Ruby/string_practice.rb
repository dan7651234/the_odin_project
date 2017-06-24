=begin
puts "What's your first name?"
firstName = gets.chomp

puts "and your middle name?"
middleName = gets.chomp

puts "how about your last name?"
lastName = gets.chomp

puts "Well hello " + firstName + " " + middleName + " " + lastName + ", it's very nice to meet you!"

puts "Do you have a favorite number? What is it?"
favoriteNumber = gets.chomp

betterNumber = favoriteNumber.to_i + 1

puts "Are you sure you like " + favoriteNumber.to_s + "? Because " + betterNumber.to_s + " is clearly a better number."
=end


puts "What do YOU want?"
want = gets.chomp.upcase

puts "WHADAYA MEAN \"" + want + "\"!?! YOU'RE FIRED!!"

=begin
bottles = 99
while bottles > 1
  puts bottles.to_s + " bottles of beer on the wall,"
  puts bottles.to_s + " bottles of beer,"
  puts "take one down, pass it around"
  bottles -= 1
  if bottles > 1
    puts bottles.to_s + " bottles of beer on the wall"
    puts ""
  else
    puts bottles.to_s + " bottle of beer on the wall"
    puts ""
  end
end

puts bottles.to_s + " bottle of beer on the wall,"
puts bottles.to_s + " bottle of beer,"
puts "take one down, pass it around"
bottles -= 1
puts bottles.to_s + " bottles of beer on the wall"
=end

=begin
puts "What do you want to say to grandma?"
byeCount = 0

while byeCount < 3
  phrase = gets.chomp
  year = 1951 - rand(20)
  if phrase == "BYE"
    byeCount += 1
    puts "NO, NOT SINCE " + year.to_s
  elsif phrase == phrase.upcase
    puts "NO, NOT SINCE " + year.to_s
    byeCount = 0
  else
    puts "HUH!? SPEAK UP SONNY"
    byeCount = 0
  end
end

puts "OK, BYE SONNY"
=end

puts "Starting Year?"
start = gets.chomp.to_i

puts "Ending Year?"
endYear = gets.chomp.to_i

yearCount = start

while yearCount <= endYear
  if yearCount % 4 == 0 && yearCount % 100 != 0
    puts yearCount.to_s
    puts ""
    yearCount += 4
  elsif yearCount % 4 == 0 && yearCount % 400 ==0
    puts yearCount.to_s
    puts ""
    yearCount += 4
  else
    yearCount += 1
  end

end

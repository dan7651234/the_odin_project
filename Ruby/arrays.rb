myArray = []

puts "Enter a string: "
input = gets.chomp

while input != ""
  myArray.push(input)
  puts "Enter another string: "
  input = gets.chomp
end

=begin myArray = myArray.sort
=end
result = []
while myArray != []
  result.push(myArray.min)
  myArray.delete(myArray.min)
end

result.each do |x|
  puts x
end

=begin
Requirements
Take a string as input.
Check if it is a letter or punctuation.
If it is a letter, convert using the given parameter (postiive integer indicates right shirt, negative a left)
Make sure to wrap around from z to a
print the result
=end

puts "Enter message to encrypt: "
input = gets.chomp
puts "Enter encryption as an integer"
shift = gets.chomp

if shift == 0
  puts "Your encryption is invalid, please enter an integer: "
  shift = gets.chomp
  shift = shift.to_i
elsif shift.to_i > 26
  shift = shift.to_i % 26
else
  shift = shift.to_i
end

puts input
puts shift.to_s

def caesar_cipher(message, encryption)
  result = ""
  message.each_char do |letter|
    if ("a".."z").include? letter
      if letter.ord + encryption < "a".ord
        result += (letter.ord + encryption + 26).chr
      elsif letter.ord + encryption > "z".ord
        result += (letter.ord + encryption - 26).chr
      else
        result += (letter.ord + encryption).chr
      end
    elsif ("A".."Z").include? letter
      if letter.ord + encryption < "A".ord
        result += (letter.ord + encryption + 26).chr
      elsif letter.ord + encryption > "Z".ord
        result += (letter.ord + encryption - 26).chr
      else
        result += (letter.ord + encryption).chr
      end
    else result += letter
    end
  end
  return result
end


print caesar_cipher(input, shift)

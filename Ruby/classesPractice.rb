#myBirth = Time.mktime(1983,11,3,10,5)
#puts myBirth  + 1000000000
=begin
puts('In what year were you born?')
birthYear = gets.chomp.to_i
puts('In what month were you born?')
birthMonth  = gets.chomp.to_i
puts('and which day in that month?')
birthDay  = gets.chomp.to_i


def alreadyHadBirthday month
  if month < Time.now.mon
    return true
  else
    return false
  end
end

if alreadyHadBirthday birthMonth
  currentAge = (Time.now - Time.mktime(birthYear,birthMonth,birthDay))/60/1440/365
else
  currentAge  = ((Time.now - Time.mktime(birthYear,birthMonth,birthDay))/60/1440/365) - 1
end

puts('Your current age is ' +currentAge.round.to_s)

def birthdaySpanks numberOfSpanks
  count = 1
  while count <= numberOfSpanks
    puts(count.to_s + ' SPANK!')
    count = count + 1
  end
end

birthdaySpanks currentAge.round
=end

class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def cheat
    puts('psst...what number do you want?')
    setValue = gets.chomp.to_i
    while setValue < 1 || setValue > 6
      puts('Theres no ' + setValue.to_s + ' on a die! Try again...')
      setValue = gets.chomp.to_i
    end
    @numberShowing = setValue
  end
end

puts Die.new.showing
puts Die.new.cheat

  #write a method that takes a block as a parameter
  #the method should run the input block once for every hour of the day that has already passed.

  def chime &dingdong
    currentHour = Time.now.hour
    if currentHour == 0
      currentHour = 12
    elsif currentHour > 12
      currentHour = currentHour - 12
    end
    puts(currentHour.to_s)
    currentHour.times do |object|
      dingdong.call
    end
  end

chime do puts('DING!')
end

=begin
Write a method that returns a pair of integers in an array that indicate the best day to buy and best day to sell a stock.
Input is an array of integers
Each array element corresponds to a day (index 0 = day 1, etc.)
Final result must be displayed as an array with the first number indicating the day to buy and the second value to be the day to sell.
=end



def stock_picker (priceHistory)
  buy = 0
  sell = 0
  spread = 0
  remaining = []

  priceHistory.each do |check|
    remaining = priceHistory[priceHistory.index(check)..priceHistory.length]

      spreadCheck = remaining.max.to_i - check
      if spreadCheck > spread
        spread = spreadCheck
        buy = priceHistory.index(check)
        sell = priceHistory.index(remaining.max)
      end
  end
  result = [buy+1, sell+1]
  puts "Max profit of " + spread.to_s + " can be made by buying and selling on the following days: "
  return result
end


print stock_picker([17,3,6,9,15,8,6,1,10])
print stock_picker([34,68,123,53,9,35,6,1,8,645,98,1,7,4,24,7546,123,456,132,678,789])
puts ""

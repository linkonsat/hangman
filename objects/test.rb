# frozen_string_literal: true
def stock_picker (prices)
  low_price = prices[0]
  low_index = 0
  profit = 0
    i = 0
  while i < prices.length do
    high_price = prices[i]
    if prices[i] < low_price
       low_price = prices[i]    
    end
    if high_price - low_price > profit
        profit = high_price - low_price  
        price_array = ["#{high_price} - #{low_price} = #{profit}"]
        result = [prices.index(low_price), prices.index(high_price) ]
    end  
    i += 1
  end
  result
  end
  p stock_picker([1,73,6,1,1500,8,6,1,99])
   
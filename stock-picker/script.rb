stocks = [17,3,6,9,15,8,6,1,10]

def stock_picker(days)
  best_day_to_buy = 0
  min_price = days[0]
  max_price = 0
  result_days = [0, 0]  

  days.each_with_index do |price, index|
    if(price < min_price)
      min_price = price
      best_day_to_buy = index
      next
    end

    if(price - min_price > max_price)
      max_price = price - min_price
      result_days = [best_day_to_buy, index]
    end
  end

  result_days
end

puts stock_picker(stocks)
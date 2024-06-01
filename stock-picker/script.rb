stocks = [17,3,6,9,15,8,6,1,10]

def stock_picker(days)
  best_day_to_buy = 0
  best_day_to_sell = 1
  max_profit = days[best_day_to_sell] - days[best_day_to_buy];
  for i in 0...(days.length - 1)
    for j in (i + 1)...(days.length)
      profit = days[j] - days[i]
      if(profit > max_profit)
        max_profit = profit
        best_day_to_buy = i
        best_day_to_sell = j
      end
    end
  end
  return [best_day_to_buy, best_day_to_sell]
end

puts stock_picker(stocks)
def stock_picker(prices_in_days)
	profit = prices_in_days[1] - prices_in_days[0]
	result = [prices_in_days[0],prices_in_days[1]]

	for i in 0...prices_in_days.length

		for j in i...prices_in_days.length

			if prices_in_days[j] - prices_in_days[i] > profit
				profit = prices_in_days[j] - prices_in_days[i]
				
				result[0] = i 
				result[1] = j
			end 
		end
	end
	return result

end



puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s
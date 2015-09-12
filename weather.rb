require 'yahoo_weatherman'

puts "Please enter your zip code: "
location = gets

def weather(loc)
	client = Weatherman::Client.new :unit => 'F'
	response = client.lookup_by_location(loc)
	
	city = response.location['city']
	region = response.location['region']
	today_num = Time.now.strftime("%w").to_i
	#today_num = 6 
	
	puts "\nForecast for #{city}, #{region}: \n"
	
	for day in 0..4
		fcast = response.forecasts[day]
		day_num = fcast['date'].strftime("%w").to_i
		day = fcast['day']
		text = fcast['text']
		temp_h = fcast['high']
		temp_l = fcast['low']
		
		if (today_num == day_num)
			puts "Today is going to be #{text}. With a low of #{temp_l} and high of #{temp_h} degrees Fahrenheit."
		elsif ((today_num < 6 && today_num + 1 == day_num) || (today_num == 6 and day_num == 0))
		#elsif((today_num + 1) % 7 == day_num)
			puts "Tomorrow is going to be #{text}. With a low of #{temp_l} and high of #{temp_h} degrees Fahrenheit."
		else 
			puts "#{day} is going to be #{text}. With a low of #{temp_l} and high of #{temp_h} degrees Fahrenheit."
		end		
	end	
end

weather(location)


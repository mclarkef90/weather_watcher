class WeatherWatcher::CLI
  
  attr_accessor :user_location_url
  
  def call 
    puts "Welcome to the Weather Watcher"
    user_input = get_user_location 
    get_user_location_weather(user_input)
    input_departure = get_leave_time
    input_return = get_return_time
    show_relevant_weather(input_departure, input_return)
  end
  
  def get_user_location
    puts "Please enter your location like this: city-state-zipcode (ex: bethesda-md-20816)"
    input = gets.chomp
  end
  
  def get_user_location_weather(user_input)
    WeatherWatcher::Scraper.get_page_for_user_location(user_input)
  end
  
  def show_user_upcoming_hours
    WeatherWatcher::Hourcard.all.each.with_index(1) do |hour, index| 
      puts "#{index}. #{hour.hour}"
    end
  end

  def get_leave_time
    puts "When will be leaving (enter number next to the hour)?"
    show_user_upcoming_hours
    input_departure = gets.chomp 
  end
  
  def get_return_time
   puts  "When will you be home (enter number next to the hour)?"
   show_user_upcoming_hours
   input_return = gets.chomp
end

def show_relevant_weather(input_departure, input_return)
  counter = input_departure.to_i - 1 
  while counter <= input_return.to_i
    WeatherWatcher::Hourcard.all.each do |hour, index| 
      puts "#{hour.hour} - Feels Like Temp: #{hour.temp} + Details: #{hour.description}"
      
    end
    counter += 1
  end
  end
end
  
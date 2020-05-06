require 'open-uri'
require 'pry'

class WeatherWatcher::Hourcard
  @@all = []
  
  attr_accessor :hour, :temp, :description 
  
  def initialize(hour, temp, description)
   @hour = hour
   @temp = temp
   @description = description
   save
  end 

def self.all
  @@all
end

def save
  @@all << self
end

def self.select_hourcard_range(depart_time, return_time)
  self.all.each do |hour|
    if depart_time <= hour >= return_time
    return @hour, @temp, @description
  end 
end
end
end


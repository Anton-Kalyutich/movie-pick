require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year, :raiting, :genre, :language, :duration, :plot
  
  def self.scrape_movies
    #Returns a bunch of Movie instances
    
    movies = []
    
    movies << self.scrape_pickrandom
    
    #Go to https://pickrandom.com/random-movie-generator/
    #Scrape properties
    #Instantiate a Movie
      
     
      
    movies
      
  end
  
  def self.scrape_pickrandom
    doc = Nokogiri::HTML(open(https://pickrandom.com/random-movie-generator/))
    
  end
  
end
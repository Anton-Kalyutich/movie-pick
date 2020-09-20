require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year, :raiting, :genre, :language, :duration, :plot
  
  def self.scrape_movies
    #Returns a bunch of Movie instances
    
    movies = []
    
    movies << self.scrape_bestrandom
    
    #Go to https://www.bestrandoms.com/random-movie-generator
    #Scrape properties
    #Instantiate a Movie
      
     
      
    movies
      
  end
  
  def self.scrape_bestrandom
    doc = Nokogiri::HTML(open(https://www.bestrandoms.com/random-movie-generator))
    doc.css("li.col-md-6:first-of-type b span").text
    
  end
  
end
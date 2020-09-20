require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year
  
  def self.scrape_movies
    
    movies = []
    
    movies << self.scrape_bestrandoms
    
    movies
  end
  
  def self.scrape_bestrandoms
    #Goes to https://bestrandoms.com/random-movie-generator
    #Scrape properties
    #Instantiate a Movie
    doc = Nokogiri::HTML(open("https://bestrandoms.com/random-movie-generator"))
    x = doc.css("li.col-md-6:first-of-type b span").text
    
    movie = Movie.new
    movie.title = x.split("(")[0]
    movie.year = x.split("(")[1][0..-2]
    movie
  end
  
end
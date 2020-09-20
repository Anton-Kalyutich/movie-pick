require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.scrape_movies
    self.scrape_bestrandoms
    
    
  end
  
  def self.scrape_bestrandoms
    #Goes to https://bestrandoms.com/random-movie-generator
    #Scrape properties
    #Instantiate a Movie and save it to Movie.all
    doc = Nokogiri::HTML(open("https://bestrandoms.com/random-movie-generator"))
    x = doc.css("li.col-md-6:first-of-type b span").text
    
    movie = Movie.new
    movie.title = x.split("(")[0]
    movie.year = x.split("(")[1][0..-2]
    self.all << movie
    movie
  end
  
  def self.scrape_suggestmemovie
    #Goes to https://suggestmemovie.com/
    #Scrape properties
    #Instantiate a Movie and save it to Movie.all
    doc = Nokogiri::HTML(open("https://suggestmemovie.com/"))
    x = doc.css("li.col-md-6:first-of-type b span").text
    
    movie = Movie.new
    movie.title = x.split("(")[0]
    movie.year = x.split("(")[1][0..-2]
    self.all << movie
    movie
  end
  
end
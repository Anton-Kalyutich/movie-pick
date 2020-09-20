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
    self.scrape_suggestmemovie
    
  end
  
  def self.scrape_bestrandoms
    #Goes to bestrandoms.com, scrapes properties, instantiates a Movie and saves it
    
    doc = Nokogiri::HTML(open("https://bestrandoms.com/random-movie-generator"))
    x = doc.css("li.col-md-6:first-of-type b span").text
    movie = Movie.new
    movie.title = x.split("(")[0]
    movie.year = x.split("(")[1][0..-2]
    self.all << movie
    movie
  end
  
  def self.scrape_suggestmemovie
    #Goes to suggestmemovie.com, scrapes properties, instantiates a Movie and saves it
    
    doc = Nokogiri::HTML(open("https://suggestmemovie.com/"))
    x = doc.css("div.col.text-center h1").text
    y = x.split
    movie = Movie.new
    movie.year = y.pop
    movie.title = y.join(" ")
    self.all << movie
    movie
  end
  
end
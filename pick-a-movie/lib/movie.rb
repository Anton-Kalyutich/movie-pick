require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.scrape_movies
    3.times do
      self.scrape_suggestmemovie
    end
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
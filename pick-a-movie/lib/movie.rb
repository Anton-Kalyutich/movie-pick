require 'open-uri'
require 'nokogiri'

class Movie
  
  attr_accessor :title, :year, :score, :plot, :genre, :language, :director
  
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
    movie = Movie.new
    
    movie.score = doc.css("div.card-body.text-center.my-3 h1").text
    
    movie_info = doc.css("div.col-sm-12 div.card.my-3:first-of-type")
    title_plus_year = movie_info.css("div.card-header").text.strip
    title_plus_year_array = title_plus_year.split
    movie.year = title_plus_year_array.pop[1...-1]
    movie.title = title_plus_year_array.join(" ")
    
    movie.plot = movie_info.css("p.card-text").text.strip
    movie.genre = movie_info.css("dl.row dd.col-sm-9:first-of-type").text
    movie.language = movie_info.css("dl.row dd.col-sm-9:nth-of-type(2)")
    movie.director = movie_info.css("dl.row dd.col-sm-9:nth-of-type(3)").text.strip
    
    self.all << movie
    movie
  end
  
end
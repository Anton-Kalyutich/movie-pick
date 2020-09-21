require_relative "../lib/movie.rb"

require 'open-uri'
require 'nokogiri'

class Scraper
  
  def self.scrape_movies
    3.times do
      self.scrape_suggestmemovie
    end
  end
  
  def self.scrape_suggestmemovie
    #Goes to suggestmemovie.com, scrapes properties, instantiates a Movie and saves it
    doc = Nokogiri::HTML(open("https://suggestmemovie.com/"))
    movie = Movie.new
    
    movie_info = doc.css("div.col-sm-12 div.card.my-3:first-of-type")
    title_plus_year = movie_info.css("div.card-header").text.strip
    title_plus_year_array = title_plus_year.split
    movie.year = title_plus_year_array.pop[1...-1]
    movie.title = title_plus_year_array.join(" ")
    
    movie.plot = movie_info.css("p.card-text").text.strip
    movie.genre = movie_info.css("dl.row dd.col-sm-9:first-of-type").text
    movie.language = movie_info.css("dl.row dd.col-sm-9:nth-of-type(2)")
    director = movie_info.css("dl.row dd.col-sm-9:nth-of-type(3)").text.strip.gsub(/\s+/, " ")
    movie.director = director.split(" , ").join(", ")
    cast = movie_info.css("dl.row dd.col-sm-9:nth-of-type(4)").text.strip.gsub(/\s+/, " ")
    movie.cast = cast.split(" , ").join(", ")
    movie.score = doc.css("div.card-body.text-center.my-3 h1").text
  end
  
end
require 'open-uri'
require 'pry'
require 'nokogiri'

class MovieScraper
  
  def self.scrape_rotten_tomatoes
    array_of_movies = []
    html = open(https://www.rottentomatoes.com/top/bestofrt/)
    doc = Nokogiri::HTML(html)
    movies = doc.css("a.unstyled.articleLink")
    movies.each do |movies|
      
      
      hash = {}
      hash[:title] = movie.css("").text
      hash[:] = student.css("p.student-location").text
      hash[:profile_url] = student.css("a").attribute("href").value
      array_of_movies << hash
    end
    array_of_movies
    
  end
end


class Scraper
  
  def self.scrape_movies
    3.times do
      self.scrape_suggestmemovie
    end
  end
  
  def self.scrape_suggestmemovie
    #Goes to suggestmemovie.com, scrapes properties and returns a hash with all the info
    doc = Nokogiri::HTML(open("https://suggestmemovie.com/"))
    movie_info = {}
    
    info = doc.css("div.col-sm-12 div.card.my-3:first-of-type")
    title_plus_year = info.css("div.card-header").text.strip
    title_plus_year_array = title_plus_year.split
    movie_info[:year] = title_plus_year_array.pop[1...-1]
    movie_info[:title] = title_plus_year_array.join(" ")
    
    movie_info[:plot] = movie_info.css("p.card-text").text.strip
    movie_info[:genre] = movie_info.css("dl.row dd.col-sm-9:first-of-type").text
    movie_info[:language] = movie_info.css("dl.row dd.col-sm-9:nth-of-type(2)")
    director = info.css("dl.row dd.col-sm-9:nth-of-type(3)").text.strip.gsub(/\s+/, " ")
    movie_info[:director] = director.split(" , ").join(", ")
    cast = movie_info.css("dl.row dd.col-sm-9:nth-of-type(4)").text.strip.gsub(/\s+/, " ")
    movie_info[:cast] = cast.split(" , ").join(", ")
    movie_info[:score] = doc.css("div.card-body.text-center.my-3 h1").text
    
    movie_info
  end
  
end
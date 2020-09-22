class Scraper
  
  def initialize
    self.scrape_suggestmemovie
  end
  
  def scrape_suggestmemovie
    #Goes to suggestmemovie.com, scrapes properties and returns a hash with all the info
    doc = Nokogiri::HTML(open("https://suggestmemovie.com/"))
    movie = Movie.new
    
    info = doc.css("div.col-sm-12 div.card.my-3:first-of-type")
    title_plus_year = info.css("div.card-header").text.strip
    title_plus_year_array = title_plus_year.split
    movie.year = title_plus_year_array.pop[1...-1]
    movie.title = title_plus_year_array.join(" ")
    
    movie.plot = info.css("p.card-text").text.strip
    movie.genre = info.css("dl.row dd.col-sm-9:first-of-type").text
    movie.language = info.css("dl.row dd.col-sm-9:nth-of-type(2)")
    director = info.css("dl.row dd.col-sm-9:nth-of-type(3)").text.strip.gsub(/\s+/, " ")
    movie.director = director.split(" , ").join(", ")
    cast = info.css("dl.row dd.col-sm-9:nth-of-type(4)").text.strip.gsub(/\s+/, " ")
    movie.cast = cast.split(" , ").join(", ")
    movie.score = doc.css("div.card-body.text-center.my-3 h1").text
    
    movie
  end
  
end
class Movie
  
  attr_accessor :title, :year, :score, :plot, :genre, :language, :director, :cast
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(movie_hash = Scraper.scrape_suggestmemovie)
    movie_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    self.class.all << self
  end
  
  def self.get_movies
    3.times do
      Movie.new
    end
  end
  
end


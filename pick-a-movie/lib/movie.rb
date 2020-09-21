class Movie
  
  attr_accessor :title, :year, :score, :plot, :genre, :language, :director, :cast
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize
    self.class.all << self
  end
  
end
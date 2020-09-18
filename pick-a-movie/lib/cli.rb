require_relative "../lib/scraper.rb"
require_relative "../lib/movie.rb"
require 'nokogiri'

class CLI
  
  def run
    greeting
    list_movies
    
  end
  
  def greeting
    puts "Hi there! We'll make a random choice of 3 movies for you!"
    puts "Press 'enter' when you're ready."
    if gets.chomp == "\n"
      #just moving on to the next method here
    end
  end
  
  def menu
    
  end
  
  def list_movies
    puts "Here you go:"
    puts "1. Lady Bird (2017) - 99% on 'Rotten Tomatoes'"
    puts "2. God Father (1972) - 9,2 on 'IMDb'"
    puts "3. "
  end
    
  
  def bye
    puts "Enjoy your movie!"
  end
  
end
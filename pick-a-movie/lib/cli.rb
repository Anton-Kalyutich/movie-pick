require_relative "../lib/scraper.rb"
require_relative "../lib/movie.rb"
require 'nokogiri'

class CLI
  
  def run
    greeting
    list_movies
    menu
    bye
  end
  
  def greeting
    #greets the user and tells him/her the program works
    puts "Hi there! We'll pick few random movies for you!"
    sleep 1
  end
  
  def list_movies
    #lists 3 movies randomly selected from https://pickrandom.com/random-movie-generator/
    puts "Here they are:"
    @movies = Movie.today
    @movies.each_with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} (#{movie.year})"
    end
  end
  
  def menu
    input = nil
    while input != 'exit'
      puts "\nEnter '1', '2', or '3' to learn more about a movie (or enter 'exit'):"
      input = gets.strip.downcase
      
      if input.to_i > 0
        the_movie = @movies[input.to_i-1]
        puts "#{i}. #{the_movie.title} (#{the_movie.year})"
      elsif input == 'list'
        list_movies
      else
        puts "Sorry, I didn't get it. Entet 'list' or 'exit'."
      end
    end
  end
    
  
  def bye
    puts "\nHope that helped, bye-bye now!"
  end
  
end
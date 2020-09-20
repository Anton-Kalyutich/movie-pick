require_relative "../lib/movie.rb"
require "pry"

class CLI
  
  def run
    Movie.scrape_movies
    greeting
    list_movies
    menu
    bye
  end
  
  def greeting
    #greets the user and tells him/her the program works
    puts "Hi there! We'll pick 3 random movies for you!"
    sleep 1
  end
  
  def list_movies
    #lists 3 movies randomly selected movies from...
    puts "\nHere you go:"
    @movies = Movie.all
    @movies.each_with_index do |movie, i|
      puts "#{i+1}. #{movie.title} (#{movie.year})"
    end
  end
  
  def menu
    input = nil
    while input != 'exit'
      puts "\nEnter '1', '2', or '3' for more info on a movie (or enter 'list' or 'exit'):"
      input = gets.strip.downcase
      
      if input.to_i > 0
        the_movie = @movies[input.to_i-1]
        puts "\nTitle: #{the_movie.title}"
        puts "Released: #{the_movie.year}"
        puts "Genre: #{the_movie.genre}"
        puts "IMDb score: #{the_movie.score}"
        puts "Director: #{the_movie.director}"
        puts "Cast: #{the_movie.cast}"
        puts "Short description: #{the_movie.plot}"
        
      elsif input == 'list'
        list_movies
      else
        puts "Sorry, I didn't get it. Enter 'list' or 'exit'."
      end
    end
  end
    
  
  def bye
    puts "\nHope that helped, bye-bye now!"
  end
  
end
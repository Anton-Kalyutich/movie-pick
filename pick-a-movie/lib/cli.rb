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
    #lists 6 movies randomly selected from https://pickrandom.com/random-movie-generator/
    puts "Here they are:"
    @movies = Movie.today
    @movies.each_with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} (#{movie.year})"
    end
  end
  
  def menu
    input = nil
    while input != 'done'
    #gotta fix weird 'q' behaviour later
      puts "\nEnter '1', '2', or '3' to learn more about a movie (enter 'q' to exit):"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on movie 1..."
      when "2"
        puts "More info on movie 2..."
      when "3"
        puts "More info on movie 3..."
      when 'done'
        break
      else
        puts "Sorry, I didn't get it."
        sleep 1
        menu
      end
    end
  end
    
  
  def bye
    puts "\nHope that helped, bye-bye now!"
  end
  
end
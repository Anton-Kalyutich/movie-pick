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
    puts "Hi there! We'll pick 3 random movies for you!"
    puts "Press 'enter' when you're ready."
    gets
  end
  
  def list_movies
    #lists 3 movies randomly selected frm the corrsponding websites
    puts "Here you go:"
    puts "1. Lady Bird (2017) - 99% on 'Rotten Tomatoes'."
    puts "2. God Father (1972) - 9,2 on 'IMDb'."
    puts "3. Citizen Kane (1941) - 100% on 'Metacritic'."
  end
  
  def menu
    input = nil
    while input != 'q'
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
      when 'q'
        break
      else
        puts "Sorry, I didn't get it."
        sleep 1
        menu
      end
    end
  end
    
  
  def bye
    puts "\nEnjoy the movie!"
  end
  
end
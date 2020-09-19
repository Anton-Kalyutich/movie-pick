require_relative "../lib/scraper.rb"
require_relative "../lib/movie.rb"
require 'nokogiri'

class PickAMovie::CLI
  
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
    #lists 6 movies randomly selected from https://bestrandoms.com/random-movie-generator
    puts "Here they are:"
      puts "1. Polar (2019)"
      puts "2. Back to the Future Part III (1990)"
      puts "3. Charlie's Angels (2019)"
      puts "4. The Boxtrolls (2014)"
      puts "5. The Descent (2005)"
      puts "6. The Verdict (1982)"
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
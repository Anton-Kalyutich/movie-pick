class CLI
  
  def run
    Scraper.scrape_movies
    greeting
    list_movies
    menu
    goodbye
  end
  
  def greeting
    puts "Hi there! We'll pick 3 random movies for you!"
    sleep 2
  end
  
  def list_movies
    puts "\nHere you go:"
    Movie.all.each_with_index do |movie, i|
      puts "#{i+1}. #{movie.title} (#{movie.year})"
    end
  end
  
  def menu
    input = nil
    until input == 'done'
      puts "\nEnter '1', '2', or '3' for more info on a movie (or enter 'list' or 'done'):"
      input = gets.strip.downcase
      i = input.to_i
      movies = Movie.all
      
      if i > 0 && i <= movies.size
        the_movie = movies[i-1]
        puts "\nTitle: '#{the_movie.title}'"
        puts "Released: #{the_movie.year}"
        puts "Genre: #{the_movie.genre}"
        puts "IMDb score: #{the_movie.score}"
        puts "Director: #{the_movie.director}"
        puts "Cast: #{the_movie.cast}"
        puts "Short description: #{the_movie.plot}"
        
      elsif input == 'list'
        list_movies
      else
        puts "Sorry, I didn't get it." unless input == "done"
        sleep 0.5
      end
    end
  end
  
  def goodbye
    puts "\nHope we could help, goodbye now!"
  end
  
end
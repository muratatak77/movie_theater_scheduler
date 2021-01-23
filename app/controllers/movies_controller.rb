class MoviesController < ApplicationController

  def compute
    movies_params = params[:_json].as_json
    movie_list = []
    movies_params.each do |prm|
   		title = prm["title"]
      year = prm["year"]
   		rated = prm["rated"]
   		duration = prm["duration"]
      if title.present? and duration.to_i > 0
   		 movie = Movie.new(title, year, rated, duration)
      end
   		movie_list << movie if movie.present? and movie.title.present?
   	end
    
    return [] if movie_list.nil? || movie_list.size == 0
    start_operation(movie_list)
 
  end

  private 

  def start_operation(movie_list) 
    main_result = []
    movie_list.each do |movie|
      operation = Operation.new(movie_duration: movie.duration)
      movies_list = {
        "video_title": movie.title,
        "video_year": movie.year,
        "video_rated": movie.rated,
        "weekday_show_times": operation.weekday_show_times,
        "weekend_show_times": operation.weekend_show_times,
      }
      main_result << movies_list
    end
    output_list(main_result)
  end

  def output_list(json)
    puts "-------------------------------------------"
    json.each do |item|
      puts item[:video_title]
      puts "Weekday"
      item[:weekday_show_times].each do |hour|
        hour = hour.to_h
        puts "#{hour[:start_hour]} - #{hour[:end_hour]}"
      end
      puts "Weekend"
      item[:weekend_show_times].each do |hour|
        hour = hour.to_h
        puts "#{hour[:start_hour]} - #{hour[:end_hour]}"
      end
      puts "-------------------------------------------"
    end
  end
  
end

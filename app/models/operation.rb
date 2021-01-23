include WorkingHours
include Rules
require 'date_utils'
require 'enums'

class Operation

	attr_accessor :weekday_show_times, :weekend_show_times, :movie_duration

	def initialize(weekday_show_times: [], weekend_show_times: [], movie_duration: 0)
		@movie_duration = movie_duration
		@weekday_show_times = create_weekday_list
		@weekend_show_times = create_weekend_list
	end

	def create_weekend_list
  	opening_hour = get_weekend_hours[0]
    closing_hour = get_weekend_hours[1]
    get_hours_list(opening_hour,closing_hour)
  end

  def create_weekday_list
    opening_hour = get_weekday_hours[0]
    closing_hour = get_weekday_hours[1]
		get_hours_list(opening_hour,closing_hour)
  end

  private 

  def get_hours_list(opening_hour, closing_hour)
  	default_movie_operation_time = Enums::PREPATE_TIME + Enums::PREVIEW_TIME
    total_working_minute = DateUtils.second_to_min(closing_hour - opening_hour)
    max_video_count_per_day = get_max_video_count_per_day(total_working_minute, default_movie_operation_time, @movie_duration)
    hours_result = []
    previous_movie_time = 0
    for i in (max_video_count_per_day).downto(1)
      if i == max_video_count_per_day
      	#first video we can movie duration minute from extract closing hour 
        start_movie_time = closing_hour - @movie_duration.minutes
      else
      	#first another videos, we can add default movie operation time + movie duration
      	#and we can extract previous movie time  to find next start movie time
        start_movie_time_diff = default_movie_operation_time + @movie_duration
        start_movie_time = previous_movie_time - start_movie_time_diff.minutes
      end
      start_movie_time =  get_adjust_easy_read_time(start_movie_time)
      hours_result << get_start_end_time_by_format(start_movie_time, @movie_duration)

      #we need to set previous movie time to compute next video
      previous_movie_time = start_movie_time
    end
    hours_result.reverse
  end

end
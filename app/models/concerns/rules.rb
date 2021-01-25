require 'date_utils'
require 'enums'

module Rules
	extend ActiveSupport::Concern


=begin
  we can find  how many there are max movie could watch in a day.
  we can iterate easier. We can find last and first video easy way
  Logic
  we can start to extract default movie spend time from our total daily working time.
  we can check is less then default first movie total spend time we need break from while.
  Why we need check first movie operation time because , if we have enough time to release first video , we can contunie,
  but otherwise we have to exit from while iteration
=end
  def get_max_video_count_per_day(total_daily_working_minute, default_movie_operation_time, movie_duration)
    count = 1
    default_movie_total_spend_time = movie_duration + default_movie_operation_time
    default_first_movie_total_spend_time = movie_duration + Enums::OPENING_OPERATION_TIME + default_movie_operation_time
    while true 
      total_daily_working_minute -= default_movie_total_spend_time
      if total_daily_working_minute < default_first_movie_total_spend_time
        break
      end
      count += 1
    end
    count
  end

  #we need to covert time to hour format 
  #we can get just minute is mod 5 that our result is 0 this minute easy read 
  #otherwise we can easy read number by reduce until our result 0
  def get_adjust_easy_read_time(time)
    minute = DateUtils.epoch_to_minute(time).to_i
    diff = minute % 5 
    time - diff.minutes
  end

	#we can convert an epoch time to just hours format in the output list
  def get_start_end_time_by_format(start_movie_time, movie_duration)
    start_time = DateUtils.epoch_to_i_hour_format(start_movie_time)
    end_time = start_movie_time + movie_duration.minutes
    end_time = DateUtils.epoch_to_i_hour_format(end_time)
    {start_hour: start_time, end_hour: end_time}
  end

end

require 'date_utils'
module WorkingHours
	extend ActiveSupport::Concern

	
	def get_weekday_hours()
		opening_hour = DateUtils.str_to_epoch("11:00:00 AM")
		closing_hour = DateUtils.str_to_epoch("11:00:00 PM")
		[opening_hour, closing_hour]
	end

	def get_weekend_hours()
		opening_hour = DateUtils.str_to_epoch("10:30:00 AM")
		closing_hour = DateUtils.str_to_epoch("12:00:00 AM") + 1.day
		[opening_hour, closing_hour]
	end
	 
end

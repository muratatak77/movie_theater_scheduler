class DateUtils

	def self.str_to_hour(str_date)
		return nil if str_date.nil?
		return str_date.to_time("%I:%M %p")
	end


	def self.str_to_epoch(str_date)
		return nil if str_date.nil?
		return str_date.to_time.to_i
	end

	def self.second_to_min(second)
		return nil if second.nil?
		return second / 60
	end

	def self.epoch_to_hour(epoch)
		return nil if epoch.nil?
		return Time.at(epoch).strftime("%H:%M %p")
	end

	def self.epoch_to_minute(epoch)
		return nil if epoch.nil?
		return Time.at(epoch).strftime("%M")
	end

	def self.epoch_to_i_hour_format(epoch)
		return nil if epoch.nil?
		return Time.at(epoch).strftime("%I:%M %p")
	end

end
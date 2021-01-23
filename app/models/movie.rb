class Movie

	attr_accessor :title, :year, :rated, :duration

	def initialize(title, year, rated, duration=0)
		@title = title
		@year = year
		@rated = rated
		@duration = duration.to_i
	end

end

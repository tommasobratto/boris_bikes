class Van 
	DEFAULT_CAPACITY = 4
	
	def initialize(options  = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def load(bike)
		@bikes << bike
	end

	def bikes_loaded
		@bikes.count
	end

end
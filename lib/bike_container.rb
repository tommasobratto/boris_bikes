module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.bike_count
	end

	def dock(bikes)
		raise 'Station is full' if full?
		bikes << bikes
	end

	def release(bikes)
		bikes.delete(bikes)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
  end

end
	
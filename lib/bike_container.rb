module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity=(value)
		@capacity = value
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise 'Holder is full' if full?
		bikes << bike
	end

	def release(bike)
		raise 'invalid release request' if bike == nil
		raise 'No bikes available' if empty? 
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity 
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
  end

  def empty?
		bike_count == 0
	end

end

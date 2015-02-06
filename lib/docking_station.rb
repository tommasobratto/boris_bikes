require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def do_what_stations_do(bike)
		dock(bike)
		bikes.each do |bike|
			release(bike) if bike.broken? == true
		end
	end

end

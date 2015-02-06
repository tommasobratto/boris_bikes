require_relative 'bike_container'

class Garage

	include BikeContainer
	
	def release_fixed_bikes(bike)
		dock(bike)
		bikes.each do |bike|
			if bike.broken? == true
				bike.fix!
				release(bike)
			else
			end
		end
	end

end
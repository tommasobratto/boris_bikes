require_relative 'bike_container'

class Garage

	include BikeContainer
	
	def do_what_garages_do(bike)
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
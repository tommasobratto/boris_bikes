require_relative 'bike_container'

class Van 

	include BikeContainer
	
	def initialize(options  = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

   def capacity
   	capacity = 6
   end
   
end
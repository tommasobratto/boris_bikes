require './lib/van.rb'

describe Van do
let (:van)         { Van.new                      												  }
let (:broken_bike) { double :bike, break!: true, broken?: true, fix!: true  }
let (:fixed_bike)  { double :bike, break!: true, broken?: false, fix!: true }
let (:station)     { double :station, do_what_stations_do: true             }
let (:garage)      { double :garage, do_what_garages_do: true               }
	
	it 'should accept broken bikes at station' do
		broken_bike.broken?
		station.do_what_stations_do(broken_bike)
		van.dock(broken_bike)
		expect(van.bike_count).to eq(1)
	end

	it 'should release broken bikes at garage' do
		broken_bike.broken?
		van.dock(broken_bike)
		van.release(broken_bike)
		garage.do_what_garages_do(broken_bike)
		expect(van.bike_count).to eq(0)
	end

	it 'should dock fixed bikes at garage' do
		broken_bike.broken?
		garage.do_what_garages_do(broken_bike)
		van.dock(fixed_bike)
 		expect(van.bike_count).to eq(1)
	end

	it 'should release fixed bikes at station' do
		fixed_bike.broken?
		van.dock(fixed_bike)
		van.release(fixed_bike)
		station.do_what_stations_do(fixed_bike)
		expect(van.bike_count).to eq(0)
	end

end

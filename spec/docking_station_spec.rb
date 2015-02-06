require 'docking_station'

describe DockingStation do
	let (:station)     { DockingStation.new(capacity: 123)        }
	let (:broken_bike) { double :bike, break!: true, broken?: true }
 	
 	it 'should allow setting default capacity on initialising' do
 		expect(station.capacity).to eq(123)
  end

  it 'should check for broken bikes and release them' do
  	broken_bike.broken?
		station.do_what_stations_do(broken_bike)  
		expect(station.bike_count).to eq(0)
	end

end
require 'garage'

describe Garage do
	let(:garage)      { Garage.new }
	let(:broken_bike) { double :bike, broken?: true, break!: true, fix!: true  }
	let(:fixed_bike)  { double :bike, broken?: false, break!: true}

	it 'should take broken bikes and release fixed bikes' do
		broken_bike.broken?
		garage.release_fixed_bikes(broken_bike)
		expect(garage.bike_count).to eq(0)
	end
	
end
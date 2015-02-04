require './lib/van.rb'

describe Van do
let (:van)  { Van.new(capacity: 6) }
let (:bike) { double :bike         }

	it 'should accept bikes at source' do
		van.dock(bike)
		expect(van.bike_count).to eq(1)
	end

end

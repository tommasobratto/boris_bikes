require './lib/van.rb'

describe Van do
let (:van)  { Van.new(capacity: 6) }
let (:bike) { double :bike}

	it 'should accept bikes at source' do
		van.load(bike)
		expect(van.bikes_loaded).to eq(1)
	end

end

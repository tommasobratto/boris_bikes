require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike)   		{ double :bike, break!: false, broken?: false }
	let(:broken_bike)   { double :bike, break!: true,  broken?: true  }
	let(:holder) 		{ ContainerHolder.new                         }

	def fill_holder(holder)
		holder.capacity.times {holder.dock(bike)}
	end

	def empty_holder(holder)
		holder.bike_count.times {holder.release(bike)}
	end

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect{ holder.dock(bike) }.to raise_error( 'Holder is full' )
	end

	it "should provide the list of available bikes" do
		broken_bike.break!
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end

 	it "should know when its empty" do
 		expect(holder).to be_empty
 	end

 	it "should not release a bike that is not there" do
 		empty_holder holder
 		expect{ holder.release(bike) }.to raise_error( 'No bikes available' )
 	end

 	it "should not release a bike if there's no argument passed" do 
 		expect{ holder.release(nil) }.to raise_error( 'invalid release request' )
 	end
end



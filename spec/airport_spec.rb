require 'airport'

RSpec.describe Airport do 
    context 'Landing a plane' do
        let(:plane) { double('plane')}
        let(:airport) { Airport.new }

        it 'instructs a plane to land' do
            expect(airport).to respond_to(:land).with(1).argument
        end

        it 'records planes that have landed' do 
            airport.land(plane)
            expect(airport.planes).to eq([plane])
        end

        it 'instructs a plane to take off' do 
            expect(airport).to respond_to(:take_off).with(1).argument
        end

        it 'confirms that a plane is no longer at the airport' do
            airport.land(plane)
            airport.take_off(plane)
            expect(airport.planes).to eq([])
        end

    end
end
require 'airport'
require 'plane'

RSpec.describe 'User stories' do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
      
    describe 'Instructing landing' do
        it 'can instruct a plane to land at an airport' do 
            expect{airport.land(plane)}.not_to raise_error
        end
    end

end
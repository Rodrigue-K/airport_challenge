require 'airport'
require 'plane'

RSpec.describe 'User stories' do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    
    it 'so plane can land, instruct a plan to land' do 
        expect{airport.land(plane)}.not_to raise_error
    end

    it 'so planes take off from an airports, instruct a plane to take off' do 
        expect{airport.take_off(plane)}.not_to raise_error
    end

end
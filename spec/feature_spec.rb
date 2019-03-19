require 'airport'
require 'plane'

RSpec.describe 'User stories' do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }
    let(:stormy?) { double('stormy')}
    
    it 'so plane can land, instruct a plan to land' do 
        allow(airport).to receive(:stormy?).and_return(false)
        expect{airport.land(plane)}.not_to raise_error
    end

    it 'so planes take off from an airports, instruct a plane to take off' do 
        allow(airport).to receive(:stormy?).and_return(false)        
        expect{airport.take_off(plane)}.not_to raise_error
    end

    it 'so that to prevent takeoff when weather is stormy' do 
        allow(airport).to receive(:stormy?).and_return(true)
        expect{airport.take_off(plane)}.to raise_error( 'Cannot take off: weather is stormy')
    end
end
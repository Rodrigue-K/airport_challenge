require 'airport'
require 'plane'
require 'weather'

RSpec.describe 'User stories' do
    let(:airport) { Airport.new(weather) }
    let(:plane) { Plane.new }
    let(:weather) { Weather.new }
    
    it 'so plane can land, instruct a plan to land' do 
        allow(weather).to receive(:stormy?).and_return(false)
        expect{airport.land(plane)}.not_to raise_error
    end

    it 'so planes take off from an airports, instruct a plane to take off' do 
        allow(weather).to receive(:stormy?).and_return(false)        
        expect{airport.take_off(plane)}.not_to raise_error
    end

    it 'so that to prevent takeoff when weather is stormy' do 
        allow(weather).to receive(:stormy?).and_return(true)
        expect{airport.take_off(plane)}.to raise_error( 'Cannot take off: weather is stormy')
    end

    it 'so that to prevent landing when weather is stormy' do 
        allow(weather).to receive(:stormy?).and_return(true)
        expect{airport.land(plane)}.to raise_error( 'Cannot land: weather is stormy')
    end

    it 'so that to prevent landing when the airport is full' do
        allow(weather).to receive(:stormy?).and_return(false)        
        allow(airport).to receive(:full?).and_return(true)
        expect{airport.land(plane)}.to raise_error( 'Cannot land: airport capacity reached')
    end

end
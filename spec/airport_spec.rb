require 'airport'

describe Airport do 
        let(:plane) { double('plane')}
        let(:airport) { Airport.new }
            describe '#land' do
                it 'instructs a plane to land' do
                    expect(airport).to respond_to(:land).with(1).argument
                end
                
                it 'records planes that have landed' do 
                    allow(airport).to receive(:stormy?).and_return(false)
                    airport.land(plane)
                    expect(airport.planes).to eq([plane])
                end
            end
            
            describe '#take_off' do
                it 'instructs a plane to take off' do 
                    expect(airport).to respond_to(:take_off).with(1).argument
                end
                
                it 'confirms that a plane is no longer at the airport' do
                    allow(airport).to receive(:stormy?).and_return(false)
                    airport.land(plane)
                    airport.take_off(plane)
                    expect(airport.planes).to eq([])
                end
            end
            
            describe '#stormy?' do
                context 'stormy weather'
                it 'prevents plane from landing' do
                    allow(airport).to receive(:stormy?).and_return(true)
                    expect{ airport.take_off(plane )}.to raise_error('Cannot take off: weather is stormy')
                end
                it 'prevents plane landing' do
                    allow(airport).to receive(:stormy?).and_return(true)
                    expect{ airport.land(plane )}.to raise_error('Cannot land: weather is stormy' )
                end
            end
        end
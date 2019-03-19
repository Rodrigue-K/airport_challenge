require 'airport'

describe Airport do 
        let(:plane) { double :plane }
        let(:airport) { Airport.new(weather, 20) }
        let(:weather) { double :weather }

        describe '#land' do
            context 'when not stormy' do
                before do
                    allow(weather).to receive(:stormy?).and_return(false)
                end
                
                it 'instructs a plane to land' do
                    expect(airport).to respond_to(:land).with(1).argument
                end
                
                it 'records planes that have landed' do 
                    airport.land(plane)
                    expect(airport.planes).to eq([plane])
                end
            end
        end
        
        describe '#take_off' do
            context 'when not stormy' do
                before do
                    allow(weather).to receive(:stormy?).and_return(false)
                end
                
                it 'can instruct a plane to take off' do 
                    expect(airport).to respond_to(:take_off).with(1).argument
                end
                
                it 'can confirms that a plane is no longer at the airport' do
                    allow(weather).to receive(:stormy?).and_return(false)
                    airport.land(plane)
                    airport.take_off(plane)
                    expect(airport.planes).to eq([])
                end
            end
        end
            
        
        describe '#stormy?' do
            context 'stormy weather'
            it 'prevents plane from taking off' do
                allow(weather).to receive(:stormy?).and_return(true)
                expect{ airport.take_off(plane )}.to raise_error('Cannot take off: weather is stormy')
            end
            
            it 'prevents plane landing' do
                allow(weather).to receive(:stormy?).and_return(true)
                expect{ airport.land(plane )}.to raise_error('Cannot land: weather is stormy' )
            end
        end
        
        describe '#full?' do 
            it 'prevents landing' do
                allow(weather).to receive(:stormy?).and_return(false)
                20.times { airport.land(plane) }
                expect{ airport.land(plane )}.to raise_error('Cannot land: airport capacity reached')
            end
        end

        context 'defaults' do
            subject(:default_airport) { described_class.new(weather) }
            
            it 'has a default capacity' do
                default_airport = described_class.new(weather)
                allow(weather).to receive(:stormy?).and_return(false)
                described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
                expect{default_airport.land(plane)}.to raise_error('Cannot land: airport capacity reached')
            end
        end
    end

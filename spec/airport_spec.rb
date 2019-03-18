require 'airport'

RSpec.describe Airport do 
    context 'Landing a plane' do
        let(:plane) { double('plane')}
        let(:airport) { Airport.new }

        it 'instructs a plane to land' do
            expect(airport).to respond_to(:land).with(1).argument
        end

    end
end
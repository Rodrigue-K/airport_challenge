require 'weather'

class Airport

    attr_reader :planes

    CAPACITY = 20

    def initialize(weather)
        @planes = []
        @weather = weather
    end 

    def land(plane)
        raise 'Cannot land: weather is stormy' if stormy?
        raise 'Cannot land: airport capacity reached' if full?
        @planes.push(plane)
    end

    def take_off(plane)
        raise 'Cannot take off: weather is stormy' if stormy?
        @planes.delete(plane)
    end

    private 

    def stormy?
        @weather.stormy?
    end

    def full?
        @planes.length == CAPACITY
    end
end
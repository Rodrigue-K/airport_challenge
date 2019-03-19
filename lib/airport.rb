require 'weather'

class Airport

    DEFAULT_CAPACITY = 20
    attr_reader :planes, :weather, :capacity

    def initialize(weather, capacity= DEFAULT_CAPACITY)
        @capacity = capacity
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
        @planes.length >= @capacity
    end
end
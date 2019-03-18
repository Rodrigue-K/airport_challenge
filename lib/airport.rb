class Airport

    attr_reader :planes

    def initialize
        @planes = []
    end 

    attr_reader :airfield

    def land(plane)
        @planes.push(plane)
    end

    def take_off(plane)
        @planes.delete(plane)
    end

end
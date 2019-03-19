class Weather

    def stormy?
        weather_forcast > 5
    end

    private

    def weather_forcast
        rand(1..10)
    end
end
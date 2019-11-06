class Flight

    attr_reader :passengers

    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end
    
    def board_passenger(passenger_obj)
        if passenger_obj.has_flight?(@flight_number) && !self.full?
            @passengers << passenger_obj
        end
    end

    def list_passengers
        @passengers.map{|obj| obj.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger_obj)
        self.board_passenger(passenger_obj)
    end

end
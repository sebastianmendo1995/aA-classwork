class Card
    attr_reader :value, :reveal

    def initialize(value, reveal=false)
        @value = value
        @reveal = reveal
    end

    def hide_card
        @reveal = false
    end

    def reveal_card
        @reveal = true
    end

    def reveal?
        @reveal == true
    end

    def to_s
        if self.reveal?
            self.value
        else
            " "
        end
    end

    def ==(card) #card is an instance of Card
        self.value == card.value
    end
end
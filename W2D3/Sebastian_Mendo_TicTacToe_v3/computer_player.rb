class ComputerPlayer
    attr_accessor :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        p "computer mark : #{@mark} chose position #{pos}"
        pos
    end
end
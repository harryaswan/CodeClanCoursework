class Board

    attr_reader(:state)
    def initialize(size, positions)
        @state = Array.new(size, 0)
        for k in positions.keys
            @state[k] = positions[k]
        end
    end

    def win_tile()
        return @state.length-1
    end

end

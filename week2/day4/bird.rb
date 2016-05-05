class Bird

    attr_reader(:num_legs)

    def initialize(legs)
        @num_legs = legs
    end

    def fly
        return "flying"
    end

end

require_relative('bird')
class Duck < Bird

    def initialize(legs)
        super(legs)
        @attitude = "off the scale"
    end

end

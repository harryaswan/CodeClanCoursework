require_relative('Creature')

class Animal < Creature

    def initialize(type, legs, appr, habitat, noise)
        @noise = noise
        super(type, legs, appr, habitat)
    end

    def noise
        return @noise
    end

end

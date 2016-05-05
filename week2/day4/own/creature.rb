class Creature

    attr_reader(:type, :legs, :appearance, :habitat)
    def initialize(type, legs, appr, hab)
        @type = type
        @legs = legs
        @appearance = appr
        @habitat = hab
    end

    def noise
        return nil
    end

end

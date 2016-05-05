require_relative('Creature')

class Human < Creature

    attr_reader(:name)
    def initialize(name)
        @name = name
        appr = ["hair", "stands upright", "is... humany?"]
        super(:human, 2, appr, :earth)
    end

    def noise
        return "Speaking in a language"
    end

end

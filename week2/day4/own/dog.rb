require_relative('animal')
class Dog < Animal

    def initialize(name)
        @name = name
        appearance = ['Fluffy', 'Has a tail', "Man I'm bad at describing animals"]
        super(:dog, 4, appearance, :domestic, "Bark!")
    end

end

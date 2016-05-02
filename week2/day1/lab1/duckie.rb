class Duckie

    attr_accessor(:name, :colour)
    def initialize(name, colour)
        @name = name
        @colour = colour
    end

    def help()
        return speak()
    end

    def speak()
        return "Quack!"
    end

end

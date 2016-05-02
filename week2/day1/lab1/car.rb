class Car
    attr_accessor(:make, :model, :doors, :fuel)

    def initialize(make, model, doors, fuel)
        @make = make
        @model = model
        @doors = doors
        @fuel = fuel
        @locked = true
    end

    def horn()
        return "Honk! Honk!"
    end
    def calculate_max_distance()
        return ((500/100) * fuel)
    end
    def un_lock()
        @locked = !@locked
    end
    def locked?()
        return @locked
    end

end

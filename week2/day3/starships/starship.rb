class Starship

    attr_accessor(:name, :value)
    attr_reader(:manufacturer, :model, :cargo, :crew, :cost)

    def initialize(name, manufacturer, model, cargo, crew, cost)
        @name = name
        @manufacturer = manufacturer
        @model = model
        @cargo = cargo
        @crew = crew
        @cost = cost
        @value = cost
    end

    def to_h()
        # {name: "JeffMobile", manufacturer: "Kuat Drive Yards", model: "A-9 Vigilance Interceptor", cargo: 55, crew: 1, cost: 185000, value: 184000 }
        return {name: @name, manufacturer: @manufacturer, model: @model, cargo: @cargo, crew: @crew, cost: @cost, value: @value}
    end

end

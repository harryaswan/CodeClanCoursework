require_relative('animal')
class Snake < Animal

    def initialize(name)
        @name = name
        appr = ['Scaley', 'Long and thin', 'Beady eyes']
        super(:snake, 0, appr, :wild, "Hssss!")
    end

end

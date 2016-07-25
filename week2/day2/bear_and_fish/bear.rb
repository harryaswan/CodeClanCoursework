class Bear
    attr_reader(:name, :type, :tummy)
    def initialize(name, type)
        @name = name
        @type = type
        @tummy = []
    end
    def roar
        if @type == "grizzly"
            return "#{@name} is ROOOAAR-ing!"
        else
            return "#{@name} is Roaring!"
        end
    end
    def take_fish(river)
        @tummy << river.loose_fish()
    end
end

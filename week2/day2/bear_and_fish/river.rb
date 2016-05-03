class River
    attr_accessor(:name, :fishes)
    def initialize(name, fishes)
        @name = name
        @fishes = fishes
    end

    def loose_fish()
        return @fishes.pop()
    end
end

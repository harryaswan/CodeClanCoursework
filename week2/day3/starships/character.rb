class Character

    attr_reader(:name, :species)
    def initialize( name, species )
        @name = name
        @species = species
        @starships = []

    end

    def buy_ship( starship )
        starship.value -= 1000
        @starships << starship
    end

    def num_of_ships()
        return @starships.length
    end

    def view_ship( starship_name ) # viewing what ships the char has
        temp_ship = get_ship(starship_name)
        return temp_ship.to_h() if !temp_ship.nil?
    end

    def get_ship( starship_name )
        for starship in @starships
            return starship if starship.name == starship_name
        end
        return nil
    end
    def view_all_ships()
        star_hash = []
        for starship in @starships
            star_hash << starship.to_h()
        end
        return star_hash
    end

    def sell_ship(starship_name)
        if starship_name.is_a? String
            for starship in @starships
                return @starships.delete(starship) if starship.name == starship_name
            end
        elsif starship_name.is_a? Starship
            return @starships.delete(starship_name)
        end
        return nil
    end
end

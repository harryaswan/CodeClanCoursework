# require_relative('../db/sql_runner')

class OwnedPokemon

    attr_reader(:id, :pokemon_id, :trainer_id)

    def initialize(options)
        @id = options['id'].to_i()
        @pokemon_id = options['pokemon_id'].to_i()
        @trainer_id = options['trainer_id'].to_i()
    end

    def save()
        sql = "INSERT INTO owned_pokemons (pokemon_id, trainer_id) VALUES (#{@pokemon_id}, #{@trainer_id}) RETURNING *;"
        return OwnedPokemon.map_item( sql )
    end

    def self.all()
        sql = "SELECT * FROM owned_pokemons;"
        return OwnedPokemon.map_items(sql)
    end

    def self.delete_all()
        sql = "DELETE FROM owned_pokemons;"
        SqlRunner.run(sql)
    end

    def self.map_items(sql)
      pokemons = SqlRunner.run(sql)
      result = pokemons.map { |pokemon| OwnedPokemon.new( pokemon ) }
      return result
    end

    def self.map_item(sql)
      result = OwnedPokemon.map_items(sql)
      return result.first
    end


end

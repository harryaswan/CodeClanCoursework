# require_relative('../db/sql_runner')

class Pokemon

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO pokemons (name) VALUES ('#{ @name }') RETURNING *;"
    return Pokemon.map_item( sql )
  end

  def trainer()
    #   sql = "SELECT t.* FROM pokemons p INNER JOIN owned_pokemons op ON p.id=op.pokemon_id INNER JOIN trainers t ON t.id = op.trainer_id WHERE p.name = '#{@name}';"
      sql = "SELECT t.* FROM owned_pokemons op INNER JOIN trainers t ON t.id = op.trainer_id WHERE op.pokemon_id = '#{@id}';"
      return Trainer.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM pokemons;"
    return Pokemon.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM pokemons;"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    pokemons = SqlRunner.run(sql)
    result = pokemons.map { |pokemon| Pokemon.new( pokemon ) }
    return result
  end

  def self.map_item(sql)
    result = Pokemon.map_items(sql)
    return result.first
  end

end

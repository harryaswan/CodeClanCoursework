require( 'pg' )
require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name, :artist_id )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{ @name }', #{ @artist_id }) RETURNING *"
    return Album.create(sql, false)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    return Artist.create(sql)
  end

  def self.update(options)
      sql = "UPDATE artists SET name='#{options[:name]}' WHERE id=#{options[:id]} RETURNING *;"
      return Artist.create(sql, false)
  end

  def self.delete(id)
      sql = "DELETE FROM albums WHERE id = #{id};"
      SqlRunner.run(sql)
      return nil
  end

  def self.find(id)
      sql = "SELECT * FROM albums WHERE id = #{id};"
      return Album.create(sql, false)
  end

  def self.create(sql, multi=true)
      result = SqlRunner.run(sql)
      artists = result.map {|r| Album.new(r)}
      return multi ? artists : artists.first
  end

  def self.all()
    sql = "SELECT * FROM albums"
    return Album.create(sql)
  end

end

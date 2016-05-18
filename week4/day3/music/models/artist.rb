require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( '../models/album' )

class Artist

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{ @name }') RETURNING *"
    return Artist.create(sql, false)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{ @id }"
    return Album.create(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    return Artist.create(sql)
  end

  def self.update(options)
      sql = "UPDATE artists SET name='#{options[:name]}' WHERE id=#{options[:id]} RETURNING *;"
      return Artist.create(sql, false)
  end

  def self.delete(id)
      sql = "DELETE FROM albums WHERE artist_id = #{id}; DELETE FROM artists WHERE id = #{id};"
      SqlRunner.run(sql)
      return nil
  end

  def self.find(id)
      sql = "SELECT * FROM artists WHERE id = #{id};"
      return Artist.create(sql, false)
  end

  def self.create(sql, multi=true)
      result = SqlRunner.run(sql)
      artists = result.map {|r| Artist.new(r)}
      return multi ? artists : artists.first
  end

end

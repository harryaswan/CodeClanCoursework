require_relative('../db/sql_runner')
require_relative('album')
class Artist

    attr_reader(:id, :name)

    def initialize(options)
        @id = options['id'].to_i()
        @name = options['name']
    end

    def save()
        if @id == 0
            sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
        else
            sql = "UPDATE artists SET name='#{@name}' WHERE id='#{@id}' RETURNING *;"
        end
        artist = SQLRun.exec(sql)[0]
        return Artist.new(artist)
    end

    def albums()
        if @id != 0
            sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
            result = SQLRun.exec(sql)
            return result.map {|r| Album.new(r)}
        end
    end

    def self.load()
        sql = "SELECT * FROM artists;"
        result = SQLRun.exec(sql)
        return result.map{ |r| Artist.new(r) }
    end

end

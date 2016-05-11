require_relative('../db/sql_runner')
class Album

    attr_reader(:id, :name, :artist_id)

    def initialize(options)
        @id = options['id'].to_i()
        @name = options['name']
        @artist_id = options['artist_id'].to_i()
    end

    def save()
        if @id == 0
            sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', #{@artist_id}) RETURNING *;"
        else
            sql = "UPDATE artists SET name='#{@name}', artist_id=#{@artist_id} WHERE id='#{@id}' RETURNING *;"
        end
        album = SQLRun.exec(sql)[0]
        return Artist.new(album)
    end

    def artist()
        if @id != 0
            sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
            result = SQLRun.exec(sql)[0]
            artist = Artist.new(result)
            return artist
        end
    end

end

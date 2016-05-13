require_relative('../db/sql_runner')
class Pet

    attr_reader(:id, :name, :store_id, :p_type, :image)
    def initialize(options)
        @id = options['id'].to_i()
        @store_id = options['store_id'].to_i()
        @name = options['name']
        @p_type = options['p_type']
        @image = options['image']
    end

    def delete()
        if @id > 0
            sql = "DELETE FROM pets WHERE id = #{@id};"
            SQLRun.exec(sql)
            return self
        end
    end

    def edit(options)
        if options.keys.length > 0
            sql = "UPDATE pets SET "
            if options['store_id']
                @store_id = options['store_id'].to_i()
                sql << "store_id = #{@store_id}, "
            end
            if options['name']
                @name = options['name']
                sql << "name = '#{@name}', "
            end
            if options['p_type']
                @p_type = options['p_type']
                sql << "p_type = '#{@p_type}', "
            end
            if options['image']
                @image = options['image']
                sql << "image = '#{@image}', "
            end
            sql = sql[0...-2]
            sql << " WHERE id = #{@id};"
            SQLRun.exec(sql)
        end
        return nil
    end

    def save()
        if @id == 0
            sql = "INSERT INTO pets (name, store_id, p_type, image) VALUES ('#{@name}', #{@store_id}, '#{@p_type}', '#{@image}') RETURNING *;"
        else
            sql = "UPDATE pets SET name='#{@name}', store_id=#{@store_id}, p_type='#{@p_type}', image='#{@image}' WHERE id=#{@id} RETURNING *;"
        end
        result = SQLRun.exec(sql)[0]
        return Pet.new(result)
    end

    def store()
        sql = "SELECT * FROM stores WHERE id = #{@store_id};"
        result = SQLRun.exec(sql).first
        return result ? Store.new(result) : false
    end

    def self.load()
        sql = "SELECT * FROM pets;"
        result = SQLRun.exec(sql)
        return result.map {|r| Pet.new(r)}
    end

end

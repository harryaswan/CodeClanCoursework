require_relative('../db/sql_runner')
class Store

    attr_reader(:id, :name, :addr, :s_type)
    def initialize(options)
        @id = options['id'].to_i()
        @name = options['name']
        @addr = options['address']
        @s_type = options['stock_type']
    end

    def delete()
        if @id > 0
            sql = "DELETE FROM pets WHERE store_id = #{@id};"
            SQLRun.exec(sql)
            sql = "DELETE FROM stores WHERE id = #{@id};"
            SQLRun.exec(sql)
            return self
        end
    end

    def edit(options)
        if options.keys.length > 0
            sql = "UPDATE stores SET "
            if options['name']
                @name = options['name']
                sql << "name = '#{@name}', "
            end
            if options['address']
                @addr = options['address']
                sql << "address = '#{@addr}', "
            end
            if options['stock_type']
                @s_type = options['stock_type']
                sql << "stock_type = '#{@s_type}', "
            end
            sql = sql[0...-2]
            sql << " WHERE id = #{@id};"
            SQLRun.exec(sql)
        end
        return nil
    end

    def save()
        if @id == 0
            sql = "INSERT INTO stores (name, address, stock_type) VALUES ('#{@name}', '#{@addr}', '#{@s_type}') RETURNING *;"
        else
            sql = "UPDATE stores SET name='#{@name}', address='#{@addr}', s_type='#{@s_type}' WHERE id=#{@id} RETURNING *;"
        end
        result = SQLRun.exec(sql)[0]
        return Store.new(result)
    end

    def pets()
        sql = "SELECT * FROM pets WHERE store_id = #{@id};"
        result = SQLRun.exec(sql)
        return result.map {|r| Pet.new(r)}
    end

    def self.load()
        sql = "SELECT * FROM stores;"
        result = SQLRun.exec(sql)
        return result.map {|r| Store.new(r)}
    end

end

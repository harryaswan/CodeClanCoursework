
class Pizza

    attr_reader(:id, :first_name, :last_name, :topping, :quantity)

    def initialize(options)
        @id = nil || options['id'].to_i()
        @first_name = options['f_name'].capitalize()
        @last_name = options['l_name'].capitalize()
        @topping = options['topping']
        @quantity = options['qty'].to_i()
    end

    def name()
        return "#{@first_name} #{@last_name}"
    end

    def save()
        sql = "INSERT INTO pizzas (f_name, l_name, topping, qty) VALUES ('#{@first_name}', '#{@last_name}', '#{@topping}', '#{@quantity}') RETURNING *;"
        return Pizza.create(sql, false)
    end

    def self.delete(id)
        sql = "DELETE FROM pizzas WHERE id = #{id};"
        SQLRun.exec(sql)
        return nil
    end

    def self.all()
        sql = "SELECT * FROM pizzas;"
        return Pizza.create(sql)
    end

    def self.update(options)
        sql = "UPDATE pizzas SET f_name='#{options['f_name']}', l_name='#{options['l_name']}', topping='#{options['topping']}', qty=#{options['qty']} WHERE id = #{options[:id]};"
        SQLRun.exec(sql)
        return nil
    end

    def self.find(id)
        sql = "SELECT * FROM pizzas WHERE id = #{id};"
        return Pizza.create(sql, false)
    end

    def self.create(sql, multi=true)
        result = SQLRun.exec(sql)
        pizzas = result.map {|r| Pizza.new(r)}
        return multi ? pizzas : pizzas.first
    end

end

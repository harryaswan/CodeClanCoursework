
class Pizza

    attr_reader(:first_name, :last_name, :topping, :quantity)

    def initialize(options)
        @first_name = options['f_name'].capitalize()
        @last_name = options['l_name'].capitalize()
        @topping = options['topping']
        @quantity = options['qty'].to_i()
    end

    def name()
        return "#{@first_name} #{@last_name}"
    end

    def save()
        sql = "INSERT INTO pizzas (f_name, l_name, topping, qty) VALUES ('#{@first_name}', '#{@last_name}', '#{@topping}', '#{@quantity}');"
        SQLRun.exec(sql)
        return nil
    end

    def self.all()
        sql = "SELECT * FROM pizzas;"
        return Pizza.create(sql)
    end

    def self.create(sql)
        result = SQLRun.exec(sql)
        return result.map {|r| Pizza.new(r)}
    end

end

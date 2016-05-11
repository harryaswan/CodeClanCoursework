require('pg')
require('pry-byebug')
require('colorize')

class Pizza

    attr_reader(:qty, :topping, :f_name, :l_name)
    def initialize(options)
        @f_name = options['f_name']
        @l_name = options['l_name']
        @topping = options['topping']
        @qty = options['qty'].to_i()
        @id = options['id'].to_i()
    end

    def save()
        if @id == 0
            sql = "INSERT INTO pizzas (f_name, l_name, topping, qty) VALUES ('#{@f_name}', '#{@l_name}', '#{@topping}', #{@qty});"
        else
            sql = "UPDATE pizzas SET f_name='#{f_name}', l_name='#{l_name}', topping='#{topping}', qty='#{qty}' WHERE id=#{@id};"
        end
        Pizza.do_db(sql)
    end

    def delete()
        if @id > 0
            sql = "DELETE FROM pizzas WHERE id = #{@id};"
            Pizza.do_db(sql)
        end
        return self
    end

    def update(options)
        sql = "UPDATE pizzas SET "
        if options['f_name']
            @f_name = options['f_name']
            sql << "f_name = '#{@f_name}', "
        end
        if options['l_name']
            @l_name = options['l_name']
            sql << "l_name = '#{@l_name}', "
        end
        if options['topping']
            @topping = options['topping']
            sql << "topping = '#{@topping}', "
        end
        if options['qty']
            @qty = options['qty'].to_i()
            sql << "qty = '#{@qty}', "
        end
        sql = sql[0...-2]
        sql << " WHERE id = #{@id};"
        Pizza.do_db(sql)
    end

    def to_h()
        return {id: @id, f_name: @f_name, l_name: @l_name, topping: @topping, qty: @qty}
    end

    def self.do_db(sql)
        # db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
        db = PG.connect({dbname: 'dbifvpla7mc8n1', host: 'ec2-54-228-189-127.eu-west-1.compute.amazonaws.com', port: '5432', user: 'tblvokekcplfws', password: 'O9bs5kJ9gT3Hrf8eMd-a9H3XSd'})
        result = db.exec(sql)
        db.close()
        return result
    end

    def self.all()
        sql = "SELECT * FROM pizzas ORDER BY id ASC;"
        # db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
        # result = db.exec(sql)
        # db.close()
        result = Pizza.do_db(sql)
        return result.map {|pza| Pizza.new(pza)}
    end


end


# Pizza.new({'f_name' => "Seumus", 'l_name' => "Blair", 'topping' => "Chicken", 'qty' => 2}).save()
# pizza.save()
#
# pizza = Pizza.new({'f_name' => "Adam", 'l_name' => "Pinner", 'topping' => "Mushroom", 'qty' => 4})
# pizza.save()

# test = Pizza.all()
#
# test.each {|a| print "#{a.inspect} \n\n"}

# test[0].update({'topping' => 'Double Pepperoni', 'qty' => 2})
# test[1].update({'topping' => 'Hot Chilli', 'qty' => 3})

# puts test.inspect
# puts "A: #{test[0].inspect}"
# puts "B: #{test[1].inspect}"



# test.delete(test[1].delete())
#
# puts test.inspect

#
# binding.pry
# nil

require_relative ('pizza')

class PizzaShop

    def initialize()
        @orders = load_orders()
    end

    def create_order(pizza)
        @orders << Pizza.new(pizza)
    end

    def find_order(full_name)
        names = full_name.split(" ")
        return @orders.find {|o| o.f_name == names[0] && o.l_name == names[1]}
    end

    def delete_order(full_name)
        order = find_order(full_name)
        old_order = order.delete()
        if old_order
            @orders.delete(old_order)
            return true
        else
            return false
        end
    end

    def save_orders()
        @orders.each { |o| o.save() }
    end

    def load_orders()
        @orders = Pizza.all()
    end

    def view_orders()
        return @orders.map {|o| o.to_h() }
    end

    def update_order(full_name, new_items)
        pizza = @orders.index(find_order(full_name))
        @orders[pizza].update(new_items) if pizza
    end
end

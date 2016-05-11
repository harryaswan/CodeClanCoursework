require_relative('pizza_shop')
class PizzaConsole

    def initialize
        @running = true
        @pizza_shop = PizzaShop.new()
    end

    def start()
        cmd_print_help()
        while @running
            print "> "
            i = gets.chomp
            user_in(i)
        end
    end

    def user_in(input)
        case(input)
        when "help", "h"
            cmd_print_help()
        when "create order", "co"
            cmd_create_order()
        when "view orders", "vo"
            cmd_view_orders()
        when "load orders", "lo"
            cmd_load_orders()
        when "save orders", "so"
            cmd_save_orders()
        when "update order", "uo"
            cmd_update_order()
        when "delete order", "do"
            cmd_delete_order()
        when "find order", "fo"
            cmd_find_order()
        when "exit", "q"
            cmd_exit_program()
        end
    end

    def cmd_print_help()
        puts "help | h          : prints this menu out"
        puts "create order | co : creates a new order item locally, asking the relevent questions"
        puts "view orders | vo  : displays all the current orders that are local"
        puts "load orders | lo  : load into the program al the orders stored locally (Done automaticly on startup)"
        puts "save orders | so  : saves all the orders stored locally to the database"
        puts "update order | uo : updates an order, changing any or all of name, topping and quantity"
        puts "delete order | do : deletes an order from the database and locally"
        puts "find order | fo   : finds a paticular order and displays it's details to the screen"
        puts "exit | q          : closes the program, any unsaved data will be lost"
    end

    def cmd_create_order()
        puts "Please enter the customer's first name:"
        f_name = gets.chomp
        puts "Please enter the customer's last name:"
        l_name = gets.chomp
        puts "Please enter the topping for the pizza:"
        topping = gets.chomp
        puts "Please enter the number required:"
        qty = gets.chomp.to_i()
        qty += 1 if qty == 0
        @pizza_shop.create_order({'f_name' => f_name, 'l_name' => l_name, 'topping' => topping, 'qty' => qty})
    end

    def cmd_view_orders()
        orders = @pizza_shop.view_orders()
        orders.each {|a| puts "| Customer: #{a[:f_name]} #{a[:l_name]} | Topping: #{a[:topping]} | Quantity: #{a[:qty]} |"}
    end

    def cmd_load_orders()
        @pizza_shop.load_orders()
    end

    def cmd_save_orders()
        @pizza_shop.save_orders()
    end

    def cmd_update_order()
        puts "Please enter the full name of the customer:"
        fl_name = gets.chomp
        hash = {}
        puts " - ( to skip any of the following simply press enter ) - "
        puts "New customer first name:"
        f_name = gets.chomp
        hash['f_name'] = f_name if f_name != ""
        puts "New customer last name:"
        l_name = gets.chomp
        hash['l_name'] = f_name if l_name != ""
        puts "New pizza topping:"
        topping = gets.chomp
        hash['topping'] = topping if topping != ""
        puts "New quantity:"
        qty = gets.chomp
        hash['qty'] = qty if qty != ""
        @pizza_shop.update_order(fl_name, hash)
    end

    def cmd_delete_order()
        puts "Please enter the full name of the customer:"
        fl_name = gets.chomp
        if @pizza_shop.delete_order(fl_name)
            puts "Order has been deleted"
        else
            puts "There was a problem, the order may not be entirely deleted..."
        end
    end

    def cmd_find_order()
        puts "Please enter the full name of the customer:"
        fl_name = gets.chomp
        order_hash = @pizza_shop.find_order(fl_name).to_h()
        puts "Customer name: #{order_hash[:f_name]} #{order_hash[:l_name]}"
        puts "Topping: #{order_hash[:topping]}"
        puts "Quantity: #{order_hash[:qty]}"
    end

    def cmd_exit_program()
        @running = false
    end

end
con = PizzaConsole.new()
con.start()

require('pg')
require('pry-byebug')
require('colorize')

class Pizza

    attr_reader(:qty, :topping, :cust_f_name, :cust_l_name)
    def initialize(options)
        @cust_f_name = options[:f_name]
        @cust_l_name = options[:l_name]
        @topping = options[:topping]
        @qty = options[:qty].to_i()
    end

end


pizza = Pizza.new({f_name: "Harry", l_name: "Swan", topping: "Pepperoni", qty: 2})

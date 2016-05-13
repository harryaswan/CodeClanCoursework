
class Sales

    def initialize( pizzas )
        @pizzas = pizzas

    end

    def total_revenue()
        # total = 0
        # @pizzas.each {|pizza| total += (pizza.qty * 10)}
        # return total
        return @pizzas.inject(0) {|sum, pizza| sum + (pizza.qty*10)}
    end
end

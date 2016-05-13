require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pizza')
require_relative('../models/sales')

class TestSales < MiniTest::Test

    def setup()
        pizza1 = Pizza.new({'f_name' => 'Val', 'l_name' => 'Gibson', 'topping' => 'Meat', 'qty' => 1})
        pizza2 = Pizza.new({'f_name' => 'Jay', 'l_name' => 'Chetty', 'topping' => 'Pepperoni', 'qty' => 3})
        @pizzas = [pizza1, pizza2]
        @sales = Sales.new(@pizzas)
    end

    def test_total_revenue()
        test_result = @sales.total_revenue
        expected_result = 40
        assert_equal(expected_result, test_result)
    end

    # def test_template
    #     test_result = ""
    #     expected_result = ""
    #     assert_equal(expected_result, test_result)
    # end

end

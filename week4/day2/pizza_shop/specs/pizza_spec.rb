require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pizza')

class TestPizza < Minitest::Test

    def setup
        options = {'f_name'=>'Tony', 'l_name'=>'Goncalves', 'topping'=>'pepperoni', 'quantity'=>10}
        @pizza = Pizza.new(options)
    end

    def test_pizza_first_name
        test_result = @pizza.first_name
        expected_result = "Tony"
        assert_equal(expected_result,test_result)
    end

    def test_pizza_last_name
        test_result = @pizza.last_name
        expected_result = "Goncalves"
        assert_equal(expected_result,test_result)
    end

    def test_pizza_pretty_name
        test_result = @pizza.name
        expected_result = "Tony Goncalves"
        assert_equal(expected_result,test_result)
    end

    def test_topping
        test_result = @pizza.topping
        expected_result = "pepperoni"
        assert_equal(expected_result,test_result)
    end


    def test_quantity
        test_result = @pizza.quantity
        expected_result = 10
        assert_equal(Fixnum,test_result.class)
        assert_equal(expected_result,test_result)
    end

end

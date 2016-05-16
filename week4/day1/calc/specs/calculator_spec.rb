require('minitest/autorun')
require('minitest/rg')
require_relative('../models/calculator.rb')

class TestCalculator < Minitest::Test

    def setup
        @calc = Calculator.new(4, 2)
    end

    def test_add()
        test_result = @calc.add
        expected_result = 6
        assert_equal(expected_result, test_result)
    end

    def test_subtract()
        test_result = @calc.sub
        expected_result = 2
        assert_equal(expected_result, test_result)
    end

    def test_multi()
        test_result = @calc.multi
        expected_result = 8
        assert_equal(expected_result, test_result)
    end

    def test_divide()
        test_result = @calc.divide
        expected_result = 2
        assert_equal(expected_result, test_result)
    end
end

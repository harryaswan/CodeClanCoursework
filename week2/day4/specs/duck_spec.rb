require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../duck')

class TestDuck < MiniTest::Test

    def setup()
        @duck = Duck.new(2)
    end

    def test_duck_fly?()
        test_result = @duck.fly
        expected_result = 'flying'
        assert_equal(expected_result, test_result)
    end

    def test_duck_legs()
        test_result = @duck.num_legs
        expected_result = 2
        assert_equal(expected_result, test_result)
    end

end

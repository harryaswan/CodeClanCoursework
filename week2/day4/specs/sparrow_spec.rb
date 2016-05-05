require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../sparrow')

class TestSparrow < MiniTest::Test

    def setup()
        @sparrow = Sparrow.new()
    end

    def test_sparrow_fly?()
        test_result = @sparrow.fly
        expected_result = "flying"
        assert_equal(expected_result, test_result)
    end
end

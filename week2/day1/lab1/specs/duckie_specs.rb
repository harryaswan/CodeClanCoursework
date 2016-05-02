require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../duckie.rb')

class PickerTest < Minitest::Test

    def test_get_name()
        duckie = Duckie.new("Dave", "yellow")
        test_result = duckie.name
        expected_result = "Dave"
        assert_equal(expected_result,test_result)
    end

    def test_get_colour()
        duckie = Duckie.new("Dave", "yellow")
        test_result = duckie.colour
        expected_result = "yellow"
        assert_equal(expected_result,test_result)
    end

    def test_get_help()
        duckie = Duckie.new("Dave", "yellow")
        test_result = duckie.help
        expected_result = "Quack!"
        assert_equal(expected_result,test_result)
    end
end

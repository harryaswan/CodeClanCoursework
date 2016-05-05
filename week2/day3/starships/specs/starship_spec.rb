require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../starship.rb')

class StarshipTest < Minitest::Test

    def setup()
        @starship = Starship.new("JeffMobile", "Kuat Drive Yards", "A-9 Vigilance Interceptor", 55, 1, 185000)
    end

    def test_ship_name()
        test_result = @starship.name
        actual_result = "JeffMobile"
        assert_equal(actual_result,test_result)
    end

    def test_ship_cost()
        test_result = @starship.value
        actual_result = 185000
        assert_equal(actual_result,test_result)
    end

    def test_ship_change_value()
        @starship.value -= 1000
        test_result = @starship.value
        actual_result = 184000
        assert_equal(actual_result,test_result)
    end

    def test_ship_to_h
        test_result = @starship.to_h()
        actual_result = {name: "JeffMobile", manufacturer: "Kuat Drive Yards", model: "A-9 Vigilance Interceptor", cargo: 55, crew: 1, cost: 185000, value: 185000 }
        assert_equal(actual_result,test_result)
    end
end

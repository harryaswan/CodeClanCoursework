require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../character.rb')
require_relative('../starship.rb')

class CharacterTest < Minitest::Test

    def setup()
        @character = Character.new("Gial Ackbar", "Mon Calameri")
        @starship = Starship.new("JeffMobile", "Kuat Drive Yards", "A-9 Vigilance Interceptor", 55, 1, 185000)
        @sold_starship = Starship.new("JeffMobile", "Kuat Drive Yards", "A-9 Vigilance Interceptor", 55, 1, 185000)
        @sold_starship.value -= 1000
    end

    def test_character_name()
        test_result = @character.name
        actual_result = "Gial Ackbar"
        assert_equal(actual_result,test_result)
    end

    def test_character_buy_ship
        @character.buy_ship(@starship)
        test_result = @character.num_of_ships
        actual_result = 1
        assert_equal(actual_result,test_result)
    end

    def test_character_view_ship
        @character.buy_ship(@starship)
        test_result = @character.view_ship("JeffMobile")
        actual_result = {name: "JeffMobile", manufacturer: "Kuat Drive Yards", model: "A-9 Vigilance Interceptor", cargo: 55, crew: 1, cost: 185000, value: 184000 }
        assert_equal(actual_result,test_result)
    end

    def test_character_sell_ship()
        @character.buy_ship(@starship)
        test_result = @character.sell_ship("JeffMobile")
        actual_result = @sold_starship
        assert_equal(actual_result.name,test_result.name)
        assert_equal(actual_result.value,test_result.value)
        assert_equal(actual_result.model,test_result.model)
    end

end

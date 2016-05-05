require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('app')


class AppTest < MiniTest::Test


    def test_tasty_pi()
        assert_equal(3.14, Math::PI)
    end

    # def test_module_play()
    #     array = Pokemon::Array.new()
    #     assert_equal( "Bulbasour" , array.pokemon )
    # end
    #
    # def test_module_joke()
    #     array = Pokemon::Array.new()
    #     assert_equal(["How do you get Pikachu on a bus....", "POKEMON!"], array.joke)
    # end
    #
    # def test_module_attack()
    #     array = Pokemon::Array.new()
    #     assert_equal("something", array.attack)
    # end
    #
    # def test_module_brackets()
    #     array = Pokemon::Array.new(5)
    #     assert_equal("something", array[1])
    # end

end

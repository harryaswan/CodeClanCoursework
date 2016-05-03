require('minitest/autorun')
require('minitest/rg')
require('colorize')
# require_relative('../board')
require_relative('../player')
# require_relative('../game')

class TestPlayer < MiniTest::Test

    def setup()
        @player = Player.new("Dave")
    end

    def test_player_has_name()
        test_result = @player.name
        expected_result = "Dave"
        assert_equal(expected_result, test_result)
    end

    def test_player_start_at_0()
        test_result = @player.position
        expected_result = 0
        assert_equal(expected_result, test_result)
    end

    def test_player_move()
        @player.move(5)
        test_result = @player.position
        expected_result = 5
        assert_equal(expected_result, test_result)
    end


    # def test_player()
    #     test_result = ""
    #     expected_result = ""
    #     assert_equal(expected_result, test_result)
    # end

end

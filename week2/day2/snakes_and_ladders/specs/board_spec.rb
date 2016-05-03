require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../board')
# require_relative('../player')
# require_relative('../game')

class TestBoard < MiniTest::Test

    def setup()
        positions = {
            2 => 4,
            7 => -7
        }
        @board = Board.new(9, positions)
    end

    def test_board_should_have_tiles()
        test_result = @board.state.size()
        expected_result = 9
        assert_equal(expected_result, test_result)
    end

    def test_position_x_is_ladder()
        test_result = @board.state[2]
        expected_result = 4
        assert_equal(expected_result, test_result)
    end

    def test_position_x_is_snake()
        test_result = @board.state[7]
        expected_result = -7
        assert_equal(expected_result, test_result)
    end

    def test_win_tile()
        test_result = @board.win_tile()
        expected_result = 8
        assert_equal(expected_result, test_result)
    end

end

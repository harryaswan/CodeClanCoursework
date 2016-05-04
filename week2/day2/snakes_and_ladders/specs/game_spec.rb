require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../board')
require_relative('../player')
require_relative('../game')

class TestGame < MiniTest::Test

    def setup()
        positions = {
            2 => 4,
            7 => -7
        }
        board = Board.new(9, positions)
        @player1 = Player.new("Val")
        @player2 = Player.new("Keith")
        @players = [@player1, @player2]
        @game = Game.new(@players, board)
    end

    def test_game_start_with_x_players()
        test_result = @game.num_of_players
        expected_result = 2
        assert_equal(expected_result, test_result)
    end

    def test_game_current_player1()
        test_result = @game.current_player()
        expected_result = @player1
        assert_equal(expected_result, test_result)
    end

    def test_update_current_player()
        @game.update_current_player()
        test_result = @game.current_player()
        expected_result = @player2
        assert_equal(expected_result, test_result)
    end

    def test_can_take_turn()
        @game.next_turn(1)

        test_result = @game.current_player()
        expected_result = @player2
        assert_equal(expected_result, test_result)

        test_result = @player1.position
        expected_result = 1
        assert_equal(expected_result, test_result)
    end

    def test_can_take_turn()
        @game.next_turn(15)
        test_result = @player1.position
        expected_result = 8
        assert_equal(expected_result, test_result)
    end

    def test_can_take_turn_with_ladder()
        @game.next_turn(2)
        test_result = @player1.position
        expected_result = 6
        assert_equal(expected_result, test_result)
    end

    def test_can_take_turn_with_snake()
        @game.next_turn(7)
        test_result = @player1.position
        expected_result = 0
        assert_equal(expected_result, test_result)
    end

    def test_can_win()
        # test_result = @game.next_turn(8)
        @game.next_turn(8)
        test_result = @game.is_won?
        expected_result = true
        assert_equal(expected_result, test_result)
    end



end

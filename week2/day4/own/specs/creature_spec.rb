require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../human')
require_relative('../dog')
require_relative('../snake')


class TestAllCreatures < MiniTest::Test

    def setup()
        @human = Human.new("Dave")
        @snake = Snake.new("Viper")
        @dog = Dog.new("Oscar")
    end

    def test_human_name()
        test_result = @human.name
        expected_result = 'Dave'
        assert_equal(expected_result, test_result)
    end

    def test_human_habitat()
        test_result = @human.habitat
        expected_result = :earth
        assert_equal(expected_result, test_result)
    end
    def test_dog_appr()
        test_result = @dog.appearance
        expected_result = ['Fluffy', 'Has a tail', "Man I'm bad at describing animals"]
        assert_equal(expected_result, test_result)
    end
    def test_snake_legs()
        test_result = @snake.legs
        expected_result = 0
        assert_equal(expected_result, test_result)
    end
    def test_human_legs()
        test_result = @human.legs
        expected_result = 2
        assert_equal(expected_result, test_result)
    end
    def test_dog_legs()
        test_result = @dog.legs
        expected_result = 4
        assert_equal(expected_result, test_result)
    end

end

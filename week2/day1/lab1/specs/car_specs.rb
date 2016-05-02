require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../car.rb')

class PickerTest < Minitest::Test

    def test_get_make()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        test_result = the_car.make
        expected_result = "Aston Martin"
        assert_equal(expected_result,test_result)
    end

    def test_get_model()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        test_result = the_car.model
        expected_result = "Vanquish"
        assert_equal(expected_result,test_result)
    end

    def test_get_doors()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        test_result = the_car.doors
        expected_result = 2
        assert_equal(expected_result,test_result)
    end

    def test_set_model()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        the_car.model = "DB9"
        test_result = the_car.model
        expected_result = "DB9"
        assert_equal(expected_result,test_result)
    end

    def test_set_fuel()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        the_car.fuel = 99
        test_result = the_car.fuel
        expected_result = 99
        assert_equal(expected_result,test_result)
    end

    def test_horn()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        test_result = the_car.horn
        expected_result = "Honk! Honk!"
        assert_equal(expected_result,test_result)
    end

    def test_calculate_max_distance()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        test_result = the_car.calculate_max_distance
        expected_result = 390
        assert_equal(expected_result,test_result)
    end

    def test_lock_unlock()
        the_car = Car.new("Aston Martin", "Vanquish", 2, 78)
        the_car.un_lock
        test_result = the_car.locked?()
        expected_result = false
        assert_equal(expected_result,test_result)
    end


end

require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../app')

class TestApp < MiniTest::Test

    def test_get_item
        test_result = find_item('a9')
        expected_result = "glowstick"
        assert_equal(expected_result, test_result)
    end

    def test_get_bay
        test_result = find_bay('glowstick')
        expected_result = "a9"
        assert_equal(expected_result, test_result)
    end

    def test_get_items
        test_result = find_items(['a9', 'a10'])
        expected_result = ["glowstick", "rubber duck"]
        assert_equal(expected_result, test_result)
    end

    def test_get_bays
        test_result = find_bays(["glowstick", "rubber duck"])
        expected_result = ['a9', 'a10']
        assert_equal(expected_result, test_result)
    end






    # def setup()
    #
    # end

    # def test_add_one_to_items()
    #     test_result = add_one([1, 2, 3])
    #     expected_result = [2, 3, 4]
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_multiplies_items()
    #     test_result = multiply_items([1, 2, 3])
    #     expected_result = [2, 4, 6]
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_up_to_you()
    #     test_result = up_to_you { |i| "Hello " + i }
    #     expected_result = "Hello Valerie"
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_map_multiply_items
    #     test_result = map([1, 2, 3]) { |i| i * 2 }
    #     expected_result = [2, 4, 6]
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_map_add_items
    #     test_result = map([1, 2, 3]) { |i| i + 2 }
    #     expected_result = [3, 4, 5]
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_array_map_add_do
    #     my_array = [1, 2, 3]
    #     test_result = my_array.map do |i|
    #         i + 1
    #     end
    #     expected_result = [2, 3, 4]
    #     assert_equal(expected_result, test_result)
    # end
    #
    # def test_each
    #     my_array = [1, 2, 3]
    #     test_result = my_array.each {|i| puts i }
    #     expected_result = [1,2,3]
    #     assert_equal(expected_result, test_result)
    #
    # end

end

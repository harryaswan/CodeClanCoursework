require( 'minitest/autorun')
require_relative( '../function_time.rb')

class My_functions < MiniTest::Test

    def test_my_name()
        name = my_name()
        assert_equal( 'Harry', name )
    end

    def test_add()
        result = add(2, 3)
        assert_equal(5, result)
    end

end

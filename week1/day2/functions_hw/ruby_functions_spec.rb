require( 'minitest/autorun' )
require_relative( 'ruby_functions_practice' )

class Functions_Practice < MiniTest::Test

  def test_return_10()
    return_10_result = return_10()
    assert_equal( 10, return_10_result )
  end

  def test_add()
    add_result = add( 1, 2 )
    assert_equal( 3, add_result )
  end

  def test_subtract()
    subtract_result = subtract( 10, 5 )
    assert_equal( 5, subtract_result )
  end

  def test_multiply()
    multiply_result = multiply( 4, 2 )
    assert_equal( 8, multiply_result )
  end

  def test_divide()
    divide_result = divide( 10, 2 )
    assert_equal( 5, divide_result )
  end

  def test_length_of_string()
    test_string = "A string of length 21"
    length_of_string = length_of_string( test_string )
    assert_equal( 21, length_of_string )
  end

  def test_join_string()
    string_1 = "Mary had a little lamb, "
    string_2 = "it's fleece was white as snow"
    joined_string = join_string( string_1, string_2 )
    assert_equal( "Mary had a little lamb, it's fleece was white as snow", joined_string )
  end

  def test_add_string_as_number()
    add_result = add_string_as_number( "1", "2" )
    assert_equal( 3, add_result )
  end

  def test_number_to_full_name()
    first_month_string = number_to_full_month_name( 1 )
    third_month_string = number_to_full_month_name( 3 )
    ninth_month_string = number_to_full_month_name( 9 )
    assert_equal( "January", first_month_string )
    assert_equal( "March", third_month_string )
    assert_equal( "September", ninth_month_string )
  end

  def test_substring()
    first_month_string = number_to_short_month_name( 1 )
    third_month_string = number_to_short_month_name( 3 )
    ninth_month_string = number_to_short_month_name( 9 )
    assert_equal( "Jan", first_month_string )
    assert_equal( "Mar", third_month_string )
    assert_equal( "Sep", ninth_month_string )
  end

  #Further

  #Given the length of a side of a cube calculate the volume
  def test_volume_of_cube()
      cube_volume_1 = volume_of_cube(5)
      cube_volume_2 = volume_of_cube(15)
      cube_volume_3 = volume_of_cube(2)
      assert_equal( 125, cube_volume_1)
      assert_equal( 3375, cube_volume_2)
      assert_equal( 8, cube_volume_3)
  end

  #Given the radius of a sphere calculate the volume
  def test_volume_of_sphere()
      sphere_volume_1 = volume_of_sphere(5)
      sphere_volume_2 = volume_of_sphere(15)
      sphere_volume_3 = volume_of_sphere(2)
      assert_equal( 523.6, sphere_volume_1)
      assert_equal( 14137.2, sphere_volume_2)
      assert_equal( 33.5, sphere_volume_3)
  end

  #http://ruby-doc.org/stdlib-2.1.1/libdoc/date/rdoc/Date.html
  #Days until christmas, Calculate how many nights there are from today until Christmas morning
  def test_days_until_christmas()
      days_until_xmas = days_until_xmas()
      assert_equal(243, days_until_xmas)
  end

  #Given a date of birth, calculate how old a person born on that date would be
  def test_age_of_person()
      age = age_of_person("30th Jan 1996")
      assert_equal(20, age)
  end


end

require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../shop.rb')
require_relative('../character.rb')
require_relative('../starship.rb')

class ShopTest < Minitest::Test

    def setup()
        @customerC = Character.new("Borsk Fey'lya", "Bothan")
        @customerB = Character.new("Lowbacca", "Wookiee")
        @customerA = Character.new("Wicket Wystri Warrick", "Ewok")
        @staffA = Character.new("Joruus C'baoth", "Human Clone")
        @staffB = Character.new("Gilad Pellaeon", "Human")
        @shop = Shop.new("The Max Rebo Store", [@staffA], [@customerA, @customerB])
        @shop.buy_from_warehouse(Starship.new("JeffMobile", "Kuat Drive Yards", "A-9 Vigilance Interceptor", 55, 1, 185000))
        @shop.buy_from_warehouse(Starship.new("The Flying Rust Bucket", "Ubrikkian Industries", "Bantha-II", 137166, 4, 8000))
        @shop.buy_from_warehouse(Starship.new("Soft and Fuzzy", "Incom Corporation", "T-16 Skyhopper", 50, 1, 14500))
        @shop.sell("The Flying Rust Bucket", "Wicket Wystri Warrick")
    end
    def test_shop_has_staff()
        test_result = @shop.num_of_staff()
        actual_result = 1
        assert_equal(actual_result,test_result)
    end
    def test_shop_add_staff()
        @shop.add_staff(@staffB)
        test_result = @shop.num_of_staff()
        actual_result = 2
        assert_equal(actual_result,test_result)
    end
    def test_shop_num_customers()
        test_result = @shop.num_of_customers()
        actual_result = 2
        assert_equal(actual_result,test_result)
    end
    def test_shop_add_staff()
        @shop.add_customer(@customerC)
        test_result = @shop.num_of_customers()
        actual_result = 3
        assert_equal(actual_result,test_result)
    end
    def test_shop_amount_of_stock()
        test_result = @shop.amount_of_stock()
        actual_result = 2
        assert_equal(actual_result,test_result)
    end
    def test_shop_sell_to_customer()
        @shop.sell("JeffMobile", "Lowbacca")
        test_result = @shop.amount_of_stock()
        actual_result = 1
        assert_equal(actual_result,test_result)
    end
    def test_shop_buy_from_customer()
        @shop.buy_from_customer("The Flying Rust Bucket", "Wicket Wystri Warrick")
        test_result = @shop.amount_of_stock()
        actual_result = 3
        assert_equal(actual_result,test_result)
    end


end

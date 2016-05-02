require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../bank_account')

class PickerTest < Minitest::Test

    def test_get_account_name()
        jay_account = BankAccount.new("Jay", 5000, "business")
        test_result = jay_account.holder_name
        expected_result = "Jay"
        assert_equal(expected_result,test_result)
    end

    def test_get_account_amount()
        jay_account = BankAccount.new("Jay", 5000, "business")
        test_result = jay_account.amount
        expected_result = 5000
        assert_equal(expected_result,test_result)
    end

    def test_get_account_type()
        jay_account = BankAccount.new("Jay", 5000, "business")
        test_result = jay_account.type
        expected_result = "business"
        assert_equal(expected_result,test_result)
    end

    def test_set_account_name()
        jay_account = BankAccount.new("Jay", 5000, "business")
        jay_account.holder_name = "Dave"
        # jay_account.set_holder_name("Dave")
        test_result = jay_account.holder_name
        expected_result = "Dave"
        assert_equal(expected_result,test_result)
    end

    def test_set_account_amount()
        jay_account = BankAccount.new("Jay", 5000, "business")
        jay_account.amount = 3000
        # jay_account.set_amount(3000)
        test_result = jay_account.amount()
        expected_result = 3000
        assert_equal(expected_result,test_result)
    end

    def test_set_account_type()
        jay_account = BankAccount.new("Jay", 5000, "business")
        jay_account.type = "personal"
        # jay_account.set_type("personal")
        test_result = jay_account.type()
        expected_result = "personal"
        assert_equal(expected_result,test_result)
    end

    def test_pay_into_account()
        jay_account = BankAccount.new("Jay", 5000, "business")
        jay_account.payin(300)
        test_result = jay_account.amount
        expected_result = 5300
        assert_equal(expected_result,test_result)
    end

    def test_pay_monthly_fee()
        jay_account = BankAccount.new("Jay", 5000, "business")
        jay_account.pay_monthly_fee()
        test_result = jay_account.amount
        expected_result = 4900
        assert_equal(expected_result,test_result)
    end

    def test_pay_monthly_fee2()
        jay_account = BankAccount.new("Jay", 5000, "personal")
        jay_account.pay_monthly_fee()
        test_result = jay_account.amount
        expected_result = 4950
        assert_equal(expected_result,test_result)
    end

    def test_withdraw()
        jay_account = BankAccount.new("Jay", 5000, "business")
        test_result = jay_account.withdraw(6000)
        expected_result = "Not enough funds"
        assert_equal(expected_result,test_result)
    end

end

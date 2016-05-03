require('minitest/autorun')
require('minitest/rg')
require('colorize')
require_relative('../bank')
require_relative('../bank_account')

class TestBankAccount < MiniTest::Test

    def setup
        bank_account1 = BankAccount.new("Jay", 5000, "business")
        bank_account2 = BankAccount.new("Rick", 1, "personal")
        bank_account3 = BankAccount.new("Val", 800, "personal")

        bank_accounts = [bank_account1, bank_account2, bank_account3]

        @bank = Bank.new(bank_accounts)
    end

    def test_bank_account_initial_state
        test_result = @bank.number_of_accounts
        expected_result = 3
        assert_equal(expected_result,test_result)
    end

    def test_total_bank_cash
        test_result = @bank.total_bank_cash
        expected_result = 5801
        assert_equal(expected_result, test_result)
    end

    def test_avg_account_value
        test_result = @bank.avg_account_value
        expected_result = 1933.67
        assert_equal(expected_result, test_result)
    end

    def test_total_business_cash
        test_result = @bank.total_cash_in_type("business")
        expected_result = 5000
        assert_equal(expected_result, test_result)
    end

    def test_largest_account_holder
        test_result = @bank.largest_account_holder
        expected_result = "Jay"
        assert_equal(expected_result, test_result)
    end

    def test_all_pay_fees
        @bank.all_pay_fees
        test_result = @bank.total_bank_cash
        expected_result = 5741
        assert_equal(expected_result, test_result)
    end


    def test_add_yearly_interest
        @bank.add_interest(3)
        test_result = @bank.total_bank_cash

        # puts @bank.get_account_info("Jay").value
        # puts @bank.get_account_info("Rick").value
        # puts @bank.get_account_info("Val").value

        expected_result = 5975.03
        assert_equal(expected_result, test_result)
    end


    def test_add_new_account
        @bank.add_account("Dave", 500, "personal")
        test_result = @bank.number_of_accounts
        expected_result = 4
        assert_equal(expected_result, test_result)
    end

    def test_remove_account
        @bank.remove_account("Dave")
        test_result = @bank.number_of_accounts
        expected_result = 3
        assert_equal(expected_result, test_result)
    end

end

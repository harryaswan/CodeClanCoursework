class Bank
    def initialize(new_accounts)
        @accounts = new_accounts
    end

    def total_bank_cash()
        total = 0
        for a in @accounts
            total += a.value
        end
        return total
    end

    def number_of_accounts
        return @accounts.length
    end

    def avg_account_value
        return (total_bank_cash().to_f() / number_of_accounts().to_f()).round(2)
    end

    def total_cash_in_type(type_as_string)
        total = 0
        for a in @accounts
            total += a.value if a.type == type_as_string
        end
        return total
    end

    def largest_account_holder
        largest_account = @accounts[0]
        for a in @accounts
            largest_account = a if a.value > largest_account.value
        end
        return largest_account.name
    end

    def all_pay_fees
        for a in @accounts
            a.pay_monthly_fee
        end
    end


    def get_account_info(name)
        for a in @accounts
            return a if a.name == name
        end
        return nil
    end

    def add_interest(interest_rate)
        for a in @accounts
            a.value += ((a.value/100) * interest_rate)
        end
    end


    def add_account(name, value, type)
        @accounts << BankAccount.new(name, value, type)
    end

    def remove_account(holder_name_as_string)
        for a in @accounts
            if a.name == holder_name_as_string
                @accounts.delete(a)
            end
        end
    end

end

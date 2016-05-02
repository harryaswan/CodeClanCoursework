
class Bank
    @accounts = []

    def initialize()

    end


end

class BankAccount

    attr_accessor(:holder_name, :amount, :type)

    def initialize(in_name, in_amount, in_type)
        @holder_name = in_name
        @amount = in_amount
        @type = in_type
    end

    def payin(money)
        @amount += money
    end

    def withdraw(money)
        if @amount > money
            return @amount -= money
        else
            return "Not enough funds"
        end
    end

    def pay_monthly_fee()
        return withdraw(50) if @type == "personal"
        return withdraw(100) if @type == "business"
    end


    # The following methods can be replaced by adding in the attr_accessor:
    # def holder_name()
    #     return @holder_name
    # end
    #
    # def amount()
    #     return @amount
    # end
    #
    # def type()
    #     return @type
    # end
    # def holder_name=(new_name)
    #     @holder_name = new_name
    # end
    #
    # def amount=(new_money)
    #     @amount = new_money
    # end
    #
    # def type=(new_type)
    #     @type = new_type
    # end
end

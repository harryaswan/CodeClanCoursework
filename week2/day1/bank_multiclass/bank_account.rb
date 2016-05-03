class BankAccount

  attr_accessor :name, :value, :type

  def initialize(name,value,type)
    @name = name
    @type = type
    @value = value.to_f()
  end

  def pay_in(value)
    @value += value
  end

  def withdraw(money)
      if @value > money
          return @value -= money
      else
          return "Not enough funds"
      end
  end

  def pay_monthly_fee()
      return withdraw(10) if @type == "personal"
      return withdraw(50) if @type == "business"
  end

  # def pay_monthly_fee()
  #  @value -= 10 if @type == 'personal'
  #  @value -= 50 if @type == 'business'
  # end

end

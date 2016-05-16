class Calculator

    def initialize(num1, num2)
        @num1 = num1
        @num2 = num2
    end

    def add()
        return Calculator.add(@num1, @num2)
    end

    def sub()
        return (@num1 - @num2)
    end

    def multi()
        return (@num1 * @num2)
    end

    def divide()
        return (@num1 / @num2)
    end

    # CLASS METHOD EQUIVILENTS

    def self.add(num1, num2)
        return (num1 + num2)
    end

    def self.sub(num1, num2)
        return (num1 - num2)
    end

    def self.multi(num1, num2)
        return (num1 * num2)
    end

    def self.divide(num1, num2)
        return (num1 / num2)
    end

end

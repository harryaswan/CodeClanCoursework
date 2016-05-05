class Shop

attr_reader :name

    def initialize(name="", staff=[], customers=[])
      #Shop.new([@staffA], [@customerA, @customerB])
      @name = name
      @staff = staff
      @customers = customers
      @stock = []
      #planet
    end


    def num_of_staff()
       return @staff.length
    end

    def add_staff( staff )
        @staff << staff
        return nil
    end

    def add_customer( customer )
        @customers << customer
        return nil
    end

    def num_of_customers
        return @customers.length
    end

    def amount_of_stock
        return @stock.length
    end

    def buy_from_warehouse( starship )
        @stock << starship
        return nil
    end

    def buy_from_customer( in_starship, in_customer )

        if in_customer.to_i > 0
            in_customer = @customers[in_customer.to_i()-1]
            if in_starship.to_i > 0
                ships_arr = in_customer.view_all_ships()
                # puts "ships: #{in_customer.sell_ship(in_customer.get_ship(ships_arr[in_starship.to_i()-1][:name]))}"
                @stock << in_customer.sell_ship(in_customer.get_ship(ships_arr[in_starship.to_i()-1][:name]))
                return true
            end
        else
            for customer in @customers
                if customer.name == in_customer
                    for starship in customer.view_all_ships
                        if starship[:name] == in_starship
                            @stock << customer.sell_ship(customer.get_ship(starship))
                            return true
                        end
                    end
                    return "A starship of the name #{in_starship} could not be found"
                end
            end
        end
    end

    def sell ( in_starship, in_customer )

        if in_starship.to_i > 0
            in_starship = @stock[in_starship.to_i()-1]
            if in_customer.to_i > 0
                in_customer = @customers[in_customer.to_i()-1]
                in_customer.buy_ship(@stock.delete(in_starship))
                return true
            end
        else
            for customer in @customers
                if customer.name == in_customer
                    for starship in @stock
                        if starship.name == in_starship
                            customer.buy_ship(@stock.delete(starship))
                            return true
                        end
                    end
                    return "A starship of the name #{in_starship} could not be found"
                end
            end
            return "A customer with the name #{in_customer} could not be found"
        end
    end

    def view_customers
        return viewchar(@customers)
    end

    def view_staff
        return viewchar(@staff)
    end

    def viewchar(arr)
        string = ""
        for char in arr
            string << "Name: #{char.name.cyan}, Species: #{char.species.cyan} \n"
        end
        return string
    end

    def view_customer(customer_number)
        arr = @customers[customer_number-1].view_all_ships()
        return format_ships(arr)
    end

    def view_stock()
        arr = []
        for x in @stock
            arr << x.to_h() if x.to_h() != {}
        end
        # puts "arr: #{arr}"
        return format_ships(arr)
    end

    def format_ships(arr)
        string = ""
        for h in arr
            string << "Name: #{h[:name]}\n".bold.cyan
            string << "      Manufacturer: #{h[:manufacturer].green}\n"
            string << "      Model: #{h[:model].green}\n"
            string << "      Cargo: #{h[:cargo].to_s().green}"
            string << "kg\n".green
            string << "      Crew: #{h[:crew].to_s().green}\n"
            string << "      Cost: #{h[:cost].to_s().green}"
            string << " credits\n".green
            string << "      Current value: #{h[:value].to_s().green}"
            string << " credits\n".green
        end
        return string
    end

end

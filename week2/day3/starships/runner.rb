require('colorize')
require_relative('shop.rb')
require_relative('character.rb')
require_relative('starship.rb')

# userinterface deals only with inputs and return

class ConsoleUI

    def initialize()
        @running = true
        demo_data()
    end

    def in(uString)

        split_string = uString.split(" ")

        case split_string[0]
        when "viewstore", "vs"
            @feedback = @shop.view_stock()
        when "viewships", "ships"
            @feedback = @shop.view_customer(split_string[1].to_i)
        when "viewcustomers", "viewc"
            @feedback = @shop.view_customers()
        when "viewstaff", "views"
            @feedback = @shop.view_staff()
        when "sell", "s"
            @feedback = @shop.sell(split_string[1], split_string[2])
        when "buy", "b"
            @feedback = @shop.buy_from_customer(split_string[1], split_string[2])
        when "addcustomer", "addc"
            add_character(false)
        when "addstaff", "adds"
            add_character(true)
        when "demo"
            demo_data()
        when "help", "h"
            printHelp
        when "exit", "q"
            puts "Adios!"
            @running = false
        else
            puts "'#{uString}' is not a recognised command..."
            self.printHelp
        end

        puts "#{@feedback}"
        @feedback = ""

    end

    def start()
        printHelp()
        while @running
            print "\n> "
            uInput = gets.chomp
            self.in(uInput)
        end
    end

    def printHelp()
        puts ""
        puts "Starship Enterprises"
        puts "---------------"
        puts "viewstore (vs)        : prints the store's stock".green
        puts "addstaff [x] [y]      : creates a new member of staff, [x] being their name, [y] being their species".green
        puts "addcustomer [x] [y]   : creates a new customer, [x] being their name, [y] being their species"
        puts "viewc                 : prints a list of all the customers to the screen"
#        puts "viewcustomer [x]      : prints the customers name, species and all the starships they own, [x] being the customer index from viewcustomers command"
        puts "ships customer(index) : prints the ships owned by customer".green
        puts "help                  : prints out this menu"
        puts "exit                  : will close the programme"
    end

    def add_character(staff=false)
        puts "Please enter the name:"
        name = gets.chomp
        puts "Please enter the species:"
        species = gets.chomp
        if (staff)
            @shop.add_staff(name, species)
        else
            @shop.add_customer(name, species)
        end
    end



    def demo_data()
        customerC = Character.new("Borsk Fey'lya", "Bothan")
        customerB = Character.new("Lowbacca", "Wookiee")
        customerA = Character.new("Wicket Wystri Warrick", "Ewok")
        staffA = Character.new("Joruus C'baoth", "Human Clone")
        staffB = Character.new("Gilad Pellaeon", "Human")
        @shop = Shop.new("The Max Rebo Store", [staffA], [customerA, customerB, customerC])
        @shop.buy_from_warehouse(Starship.new("JeffMobile", "Kuat Drive Yards", "A-9 Vigilance Interceptor", 55, 1, 185000))
        @shop.buy_from_warehouse(Starship.new("The Flying Rust Bucket", "Ubrikkian Industries", "Bantha-II", 137166, 4, 8000))
        @shop.buy_from_warehouse(Starship.new("Soft and Fuzzy", "Incom Corporation", "T-16 Skyhopper", 50, 1, 14500))
        @shop.sell("The Flying Rust Bucket", "Wicket Wystri Warrick")
    end

end

con = ConsoleUI.new()
con.start()

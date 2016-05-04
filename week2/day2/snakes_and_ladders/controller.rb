require('colorize')
require_relative('game')
require_relative('board')
require_relative('player')
require_relative('dice')

class Controller

    def initialize()
        @running = true
        @game = ''
        @dice = Dice.new()
        @got_data = false
    end

    def run()
        while @running
            if !@got_data

                @got_data = true
                players, board_size = grab_init_data()

                board = Board.new(board_size, pick_snakes_ladders(board_size))
                @game = Game.new(players, board)

            end
            print "\nIt is #{@game.current_player_name()}'s move...'"
            u_in = gets.chomp
            if u_in == "exit"
                @running = false
            else
                dice_roll = @dice.roll()
                print @dice.draw(dice_roll)
                puts "You rolled a #{dice_roll}"
                if @game.next_turn(dice_roll)
                    puts "Well Done #{@game.current_player_name()}! You WIN!"
                    @running = false
                else
                    puts "You have moved to square #{@game.player_pos(@game.current_player()) + 1}."
                end
            end
        end
        puts "Good Bye!"
    end

    def pick_snakes_ladders(board_size)
        rnd = Random.new()
        pos = []
        # TODO: Pick a random number of snakes and ladders
        pos << pick_ladder(board_size, rnd)
        pos << pick_snake(board_size, rnd)
        return pos.to_h()
    end

    def pick_ladder(board_size, rnd)
        start_point = rnd.rand(0...board_size-2)
        end_point = rnd.rand(start_point+1...board_size-1) - start_point
        puts "Ladder: #{{start_point => end_point}}"
        return [start_point, end_point]
    end

    def pick_snake(board_size, rnd)
        start_point = rnd.rand(1..board_size-2)
        end_point = (start_point - rnd.rand(0..start_point))*-1
        puts "Snake: #{{start_point => end_point}}"
        return [start_point, end_point]
    end

    def draw_board()
        board_size = @game.board_size()
        width_height = Math.sqrt(board_size).to_i
        board = Array.new(width_height, Array.new(width_height))
        out = []
        pos = {}
        alt_dir = true
        for x in (1..width_height)
            for y in (1..width_height)
                if alt_dir
                    pos[(x*y)-1] = [x-1, y-1]
                else
                    pos[(x*y)-1] = [x-1, (width_height+1)-y]
                end
                alt_dir = !alt_dir
            end
        end


        for x in (0...board_size)
            
        end


        return out
    end

    def grab_init_data()
        puts "Please enter the number of player:"
        puts "(Will default to 2 if an invalid input is entered.)"
        user_in = gets.chomp.to_i
        players = []
        user_in = 2 if user_in == 0
        for x in (1...user_in+1)
            print "Enter name #{x}: "
            user_name = gets.chomp.capitalize
            puts "#{user_name} has been setup.\n" if players << Player.new(user_name)
        end
        board_size = 2
        while (Math.sqrt(board_size).to_f != Math.sqrt(board_size).to_i || board_size <= 2)
            print "\n\nEnter the number of squares: "
            board_size = gets.chomp.to_i
            puts "Try again, not got a whole square root."
        end
        sqrt_size = Math.sqrt(board_size).to_f.round(0)
        puts "A board size of (#{sqrt_size} by #{sqrt_size}) has been set"

        return [players, board_size]
    end
end

con = Controller.new()
con.run()

require('colorize')
require('pry-byebug')
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
            print "\nIt is #{@game.player_name(@game.current_player())}'s move...'"
            u_in = gets.chomp
            if u_in == "exit"
                @running = false
            else
                dice_roll = @dice.roll()
                print @dice.draw(dice_roll)
                puts "You rolled a #{dice_roll}"
                if @game.next_turn(dice_roll)
                    draw_board()
                    puts "Well Done #{@game.player_name(@game.current_player())}! You WIN!"
                    @running = false
                else
                    draw_board()
                    puts "You have moved to square #{@game.player_pos(@game.prev_player()) + 1}."
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
        start_point = rnd.rand(1...board_size-2)
        end_point = rnd.rand(start_point+1...board_size-1) - start_point
        puts "Ladder: #{{start_point => end_point}}"
        return [start_point, end_point]
    end

    def pick_snake(board_size, rnd)
        start_point = rnd.rand(1..board_size-2)
        # puts "SnakeStart: #{start_point}"
        end_point = (start_point - rnd.rand(0..start_point))*-1
        # puts "SnakeEnd: #{end_point}"
        puts "Snake: #{{start_point => end_point}}"
        return [start_point, end_point]
    end

    def draw_board()
        board_size = @game.board_size()
        width_height = Math.sqrt(board_size).to_i
        # board = Array.new(width_height, Array.new(width_height, ""))
        board = Array.new(width_height) { Array.new(width_height, "") }
        # -----------------------
        # |  6  |   7   |   8   |
        # |[2,0]| [2,1] | [2,2] |
        # -----------------------
        # |  5  |   4   |   3   |
        # |[1,0]| [1,1] | [1,2] |
        # -----------------------
        # |  0  |   1   |   2   |
        # |[0,0]| [0,1] | [0,2] |
        # -----------------------
        #
        #

        out = []
        pos = {}
        alt_dir = true
        pos_count = 0
        for y in (1..width_height)
            for x in (1..width_height)
                if alt_dir
                    pos[pos_count] = [y-1, x-1]
                else
                    pos[pos_count] = [y-1, (width_height)-x]
                end
                pos_count += 1
            end
            alt_dir = !alt_dir
        end

        # puts "\n"
        # puts pos
        # puts "\n"

        for x in (0...board_size)
            # puts "x: #{x}"
            tmp = @game.board_state(x)
            # puts "tmp: #{tmp}"
            # puts "x+tmp: #{x+tmp}"
            if tmp > 0
                # puts "pos[x][0]: #{pos[x][0]}"
                # puts "pos[x][1]: #{pos[x][1]}"

                y_e = pos[x][0]
                x_e = pos[x][1]
                y_et = pos[x+tmp][0]
                x_et = pos[x+tmp][1]

                board[y_e][x_e] += "L:S "
                board[y_et][x_et] += "L:E "
                # puts "board #{y_e} #{x_e}"
                # puts "board+t #{y_et} #{x_et}"
                # puts "a: #{board[y_et][x_et]}"
            elsif tmp < 0
                y_e = pos[x][0]
                x_e = pos[x][1]

                y_et = pos[x+tmp][0]
                x_et = pos[x+tmp][1]

                # puts "board #{y_e} #{x_e}"
                # puts "board+t #{y_et} #{x_et}"

                board[y_e][x_e] += "S:S"
                board[y_et][x_et] += "S:E "
            end
        end

        # puts "Board: #{board}\n\n"

        for ply in (0...@game.num_of_players)
            player_pos = @game.player_pos(ply)
            # puts "pos:#{pos}"
            # puts "plypos: #{player_pos}"
            player_name = @game.player_name(ply).chr
            # puts "name: #{player_name}"
            y_e = pos[player_pos][0]
            x_e = pos[player_pos][1]
            # puts "y #{y_e} x #{x_e}"
            board[y_e][x_e] += "#{player_name} "
        end


        # puts "Board: #{board}\n\n"

        allowed_space = 10

        out << "------------"*width_height
        for x in (0...width_height)
            row = ""
            for y in (0...width_height)
                # puts "XY: (#{x}#{y}) #{board[x][y]}"
                row << "|#{board[x][y]}"
                if board[x][y].length < allowed_space
                    row << " "*(allowed_space-board[x][y].length)
                end
            end
            row << "|"
            out << row
            out << "------------"*width_height
        end
        # out << "--------------------\n"
        out = out.reverse()

        for row in out
            puts row
        end


        return nil
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

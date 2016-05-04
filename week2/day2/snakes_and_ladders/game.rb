class Game
    # attr_accessor(:current_player)
    def initialize(players, board)
        @players = players
        @board = board
        @current_player = 0
        # @current_player = players[0]
    end

    def num_of_players()
        return @players.length
    end

    def current_player()
        # return @players[@current_player]
        return @current_player
    end

    def current_player_name()
        return @players[current_player()].name
    end

    def player_pos(x)
        return @players[x].position
    end

    def next_player()
       @current_player += 1
       @current_player = 0 if @current_player >= num_of_players
    end
    def prev_player()
        prev = @current_player - 1
        prev = @players.length-1 if prev <= -1
        return prev
    end

    def board_size
        return @board.state.length
    end

    def board_state(x)
        return @board.state[x]
    end

    def next_turn(steps)
        # return if is_won?
        distance_to_end = @board.win_tile - @players[@current_player].position
        movement = steps > distance_to_end ? distance_to_end : steps
        modifier = @board.state[@players[@current_player].position + movement]
        @players[@current_player].move(movement + modifier)
        if @players[@current_player].position == @board.win_tile
            return true
        else
            next_player()
            return false
        end
    end


    # def update_current_player()
    #     @current_player = @players.rotate![0]
    # end


    # def is_won?
    #     for player in @players
    #         winner = player if player.position == @board.win_tile
    #     end
    #     return winner ? false : true
    # end

end

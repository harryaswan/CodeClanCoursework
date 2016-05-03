class Game
    attr_accessor(:current_player)
    def initialize(players, board)
        @players = players
        @board = board
        # @current_player = 0
        @current_player = players[0]
    end

    def num_of_players()
        return @players.length
    end

    def update_current_player()
        @current_player = @players.rotate![0]
    end

    def next_turn(steps)

        distance_to_end = @board.win_tile - @current_player.position
        movement = steps > distance_to_end ? distance_to_end : steps
        modifier = @board.state[@current_player.position + movement]
        @current_player.move(movement + modifier)

        if @current_player.position == @board.win_tile
            return "YOU WIN!"
            #exit game
        else
            update_current_player()
            return nil
        end
    end

    # def current_player()
    #     return @players[@current_player]
    # end

    # def next_player()
    #     @current_player += 1
    #     @current_player = 0 if @current_player => @players.length
    # end

end

$lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

class Game
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @board = Array.new(9)
    end

    def start()    
        @current_player = @player1
        game_over = false
        while !game_over do
            draw_board()
            take_turn()          
            if complete_line()
                game_over = true
                puts "#{@current_player.marker} wins!"
            elsif full_board()
                game_over = true
                puts "Cats game."
            end
            switch_player()
        end
    end

    def draw_board()
        row_separator = "--+---+--"
        col_separator = " | "
        rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
        rows.each{ |row|
            this_row = []
            row.each{ |position|
                this_row.push(@board[position] ? @board[position] : position)
            }
            puts this_row.join(col_separator)
            puts row_separator 
        }
    end

    def switch_player()
        if @current_player == @player1
            @current_player = @player2
        elsif @current_player == @player2
            @current_player = @player1
        end
    end

    def take_turn()
        puts "Enter a position to mark a #{@current_player.marker}:"
        position = gets.chomp.to_i
        if valid_position(position) 
            mark_board(position) 
        else
            puts "Invalid position. You forfeit your turn."
        end
    end

    def full_board()
        return !@board.any?(nil)
    end 

    def valid_position(position)
        if @board[position] 
            return false 
        end
        return true
    end

    def mark_board(position)
        @board[position] = @current_player.marker
    end

    def complete_line()
        $lines.any? do |line|
            line.all?{ |position| @board[position] == @current_player.marker}
        end 
    end
end
    

class Player
    def initialize(marker)
        @marker = marker
    end
    attr_reader :marker
end

player1 = Player.new('x')
player2 = Player.new('o')

new_game = Game.new(player1, player2)
new_game.start()
$positions = [0, 1, 2, 3, 4, 5, 6, 7, 8]

def draw_board()
    puts " #{$positions[0]} | #{$positions[1]} | #{$positions[2]} \n" + 
    "---+---+---\n" + 
    " #{$positions[3]} | #{$positions[4]} | #{$positions[5]} \n" + 
    "---+---+---\n" +
    " #{$positions[6]} | #{$positions[7]} | #{$positions[8]} \n"
end

class Player
    def initialize(marker)
        @marker = marker
    end

    def take_turn()
        puts "Enter a position to place a #{@marker}: "
        pos = gets.chomp.to_i
        $positions[pos] = @marker
    end
end


def game()
    player1 = Player.new('x')
    player2 = Player.new('o')
    game_over = false
    while !game_over do
        draw_board() 
        player1.take_turn() 
        draw_board()
        game_over = true
    end
end

game()
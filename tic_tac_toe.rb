positions = [0, 1, 2, 3, 4, 5, 6, 7, 8]

game_board = [
    [" #{positions[0]} | #{positions[1]} | #{positions[2]} "], 
    ["---+---+---"], 
    [" #{positions[3]} | #{positions[4]} | #{positions[5]} "], 
    ["---+---+---"], 
    [" #{positions[6]} | #{positions[7]} | #{positions[8]} "]]
  
def game(game_board)
    game_over = false
    while !game_over do
        puts game_board 
         
    end
end

game(game_board)
require './player'

# This class generates the game environment and initializes the Player instances from the Player class
class Game
    attr_accessor :cells, :end_game

    def initialize 
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        puts "Player 1, you are X. Enter your name"
        @player1 = Player.new(gets.chomp, "X")
        puts "Player 2, you are O. Enter your name"
        @player2 = Player.new(gets.chomp, "O")
        @current_player = @player1
        @end_game = false
    end
  

   # This is the method that plays the game.
   def play
      while end_game == false do
        player_select
      end
   end



   

protected


#   This Method switches turn between the two players
  def switch_player

    @current_player = (@current_player == @player1) ? @player2 : @player1

  end


# This method displays the game board's current status
    def show_board
      puts "Current Status"
      puts ""
      
      puts "#{cells[0]}  | #{cells[1]}  |  #{cells[2]}"
      puts "------------"
      puts "#{cells[3]}  | #{cells[4]}  |  #{cells[5]}"
      puts "------------"
      puts "#{cells[6]}  | #{cells[7]}  |  #{cells[8]}"
    end

    #  This method displays the map for the game to correspond to number units
    def game_map
        puts "Game Map: "
        puts ""
        puts "1|2|3"
        puts "4|5|6"
        puts "7|8|9"
    end

    # This method converts the input from the user into a zero-indexed number
    def player_choice
       puts "#{@current_player.name}'s turn: Pick a cell number from the map"
       choice = gets.chomp.to_i
       
       while choice.between?(1, 9) == false
         puts "Type a number between 1 and 9"
         choice = gets.chomp.to_i
       end
       choice - 1
    end


    # This method edits the game board to show the options chosen by the users
    def player_select
      game_map
      move = player_choice

      while cells[move] != " "
        puts "This cell has been chosen, Please select another cell"
        move = player_choice
      end
      cells[move] = @current_player.shape
      @current_player.cells_selected << move
      show_board
      check_end_game
      switch_player
    end
    
#  This method checks whether or not there is a winner or the game is a draw
    def check_end_game
      
      winning_condition = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      winning_condition.each do |condition|
        if (condition - @current_player.cells_selected).empty?
            puts "#{@current_player.name} wins"
            @end_game = true
            return @end_game
        end
        
      end
      if ((@player1.cells_selected.length + @player2.cells_selected.length) == 9)

        puts "It's a draw!"
        @end_game = true
        return end_game
      end
        return @end_game
    end


   
end

game = Game.new
game.play


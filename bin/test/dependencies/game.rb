require_relative 'player'

# This class generates the game environment and initializes the Player instances from the Player class
class Game
  attr_accessor :cells, :end_game

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @player1 = Player.new("david", "X")
    @player2 = Player.new("chibuzor", "O")
    @current_player = @player1
    @end_game = false
  end
  

  # This is the method that plays the game.
  def play
    while end_game == false do
      game_map
      player_choice
      puts show_board
      check_end_game(@current_player.cells_selected, @player1.cells_selected, @player2.cells_selected)
      switch_player
    end
  end


#   This Method switches turn between the two players
  def switch_player

    @current_player = (@current_player == @player1) ? @player2 : @player1

  end


# This method displays the game board's current status
  def show_board
    puts "Current Status"
    puts ""
    return "#{cells[0]}  | #{cells[1]}  |  #{cells[2]}" + "\n" + "------------" + "\n" + "#{cells[3]}  | #{cells[4]}  |  #{cells[5]}" + "\n" + "------------" + "\n" + "#{cells[6]}  | #{cells[7]}  |  #{cells[8]}"
  end

  #  This method displays the map for the game to correspond to number units
  def game_map
    puts "Game Map: "
    puts ""
    puts "1|2|3"
    puts "4|5|6"
    puts "7|8|9"
  end

  # This method converts the input from the user into a zero-indexed number and adds the shape of the current player into the specific position on the cells array
   
  def player_choice(choice = gets.chomp.to_i)
    puts "#{@current_player.name}'s turn: Pick a cell number from the map"
    
    while choice.between?(1, 9) == false
      raise "Type a number between 1 and 9"
    end   
    move = choice - 1

    while cells[move] != " "
      raise "This cell has been chosen, Please select another cell"
      player_choice
    end
    updates_player_cells(move)
    return @cells[move] = @current_player.shape
    
  end

  def updates_player_cells(position)
    @current_player.cells_selected << position
  end
 
  #  This method checks whether or not there is a winner or the game is a draw
  def check_end_game(current_player_cells, player1_cell, player2_cell)
      
    winning_condition = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      winning_condition.each do |condition|
      if (condition - current_player_cells).empty?
        puts "#{@current_player.name} wins"
        @end_game = true
        return @end_game
      end
        
    end
      
    if ((player1_cell.length + player2_cell.length) == 9)
        
      puts "It's a draw!"
      @end_game = true
      return end_game
    end
    return @end_game
  end
  
end



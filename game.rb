require './player'

class Game
    attr_accessor :cells;

    def initialize 
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      player1 = Player.new("Player 1", "X")
      player2 = Player.new("Player 2", "O")
      @current_player = player1

    end

  def switch_player

    current_player = (current_player == player1) ? player2 : player1

  end


    def show_board
      puts "Current Status"
      puts ""
      
      puts "#{cells[0]}  | #{cells[1]}  |  #{cells[2]}"
      puts "------------"
      puts "#{cells[3]}  | #{cells[4]}  |  #{cells[5]}"
      puts "------------"
      puts "#{cells[6]}  | #{cells[7]}  |  #{cells[8]}"
    end

    def game_map
        puts "Game Map: "
        puts ""
        puts "1|2|3"
        puts "4|5|6"
        puts "7|8|9"
    end

    def player_choice
       puts "#{@current_player.name}'s turn: Pick a cell number from the map"
       choice = gets.chomp.to_i
       
       if choice.between?(1, 9) == false
         puts "Type a number between 1 and 9"
         choice = gets.chomp.to_i
       end
       choice - 1
    end

    def player_select
      
    end




end
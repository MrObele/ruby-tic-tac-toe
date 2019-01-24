require_relative 'player'
require_relative '../bin/util/message'
require_relative 'board'
# This is the Game Class

class Game
  attr_accessor :end_game

  def initialize
    @end_game = false
    @message = Messages.new
    @player1 = Player.new('Player 1', "X")
    @player2 = Player.new('Player 2', "O")
    @current_player = @player1
    @board = Board.new
  end

  def get_player1  # These three methods are for testing purposes only
    @player1
  end

  def get_player2
    @player2
  end

  def get_current_player
    @current_player
  end
  # end of test methods





  # This is the method that starts the game play.
  def play
    while end_game == false do
      @message.ask_for_input(@current_player.name)
      play_game
    end
 end 

  # protected

  def choose_cell(choice = @message.collect().to_i)
    until choice.between?(1, 9) == true
      @message.ask_for_input(@current_player.name)
      choice = @message.collect().to_i
    end
    choice - 1
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
    @current_player
  end



  def play_game
    @message.show_map
    option = choose_cell
    until @board.cells[option] == " "
      @message.chosen_cell
      option = choose_cell
    end
    @current_player.record_choice(option)
    @board.cells[option] = @current_player.shape
    @message.show_board(@board.cells)
    check_end_game
    switch_player
  end

  def check_end_game
    winning_condition = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
    winning_condition.each do |condition|
      if (condition - @current_player.cells_selected).empty?
          @message.display("#{@current_player.name} wins")
          @end_game = true
          return @end_game
      end
      
    end
  
    if ((@player1.cells_selected.length + @player2.cells_selected.length) == 9)
  
      @message.display("It's a draw!")
      @end_game = true
      return end_game
    end
      return @end_game
  end

end


# game = Game.new
# game.play()


require './lib/game'

describe Game do
 
  before(:all) do
    @player1 = Player.new("david", "X")
    @player2 = Player.new("chibuzor", "O")
    @current_player = @player1
    @end_game = false
    @board = Board.new
  end

   describe "#switch_player" do
   game = Game.new
   
    it "should change to player2 if current player is player1" do 
      expect(game.switch_player).to eql(game.get_player2)
    end
  end

  describe "#choose_cell" do

    game = Game.new
    it "converts player input to zero-index based number" do 
      expect(game.choose_cell(9)).to eql(8)
    end

  end

  describe "#check_end_game" do
  game = Game.new
  game.get_current_player.cells_selected = [0, 1, 2]
    it 'ends the game if a player posesses a winning sequence' do
      expect(game.check_end_game).to be_truthy
    end
  game = Game.new
  game.get_player2.cells_selected = [0, 2, 5, 6]
  game.get_player1.cells_selected = [1, 3, 4, 7, 8]
    it 'ends the game when there are no more options to take' do
      expect(game.check_end_game).to be_truthy
    end
  end
end

require_relative '../dependencies/game'

describe Game do
 
  before(:all) do
    @player1 = Player.new("david", "X")
    @player2 = Player.new("chibuzor", "O")
    @current_player = @player1
    @end_game = false
  end

   describe "#switch_player" do
   game = Game.new
    it "should change to player2 if current player is player1" do 
      expect(game.switch_player.name).to eql(@player2.name)
    end
  end
  describe "#show_board" do
  game = Game.new
    it "should change the current state of a board box" do 
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(game.show_board).to eql("   |    |   " + "\n" + "------------" + "\n" + "   |    |   " + "\n" + "------------" + "\n" + "   |    |   ")
    end

  end

  before do
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @player1 = Player.new("david", "X")
    @player2 = Player.new("chibuzor", "O")
    @current_player = @player1
    @end_game = false
  end
  describe "#player_choice" do

    game = Game.new
    it "throw exception when the user tries to supply a number outside the range 1 to 9" do 
      expect{game.player_choice(12)}.to raise_error RuntimeError
    end
    it "Assigns the current player's shape to the specified cell" do 
      expect(game.player_choice(9)).to eql(@current_player.shape)
    end

    it "throw exception if the current cell chosen is already occupied" do 
      expect{game.player_choice(9)}.to raise_error RuntimeError
    end
  end


  describe "#updates_player_cells" do
  game = Game.new
  it "Add the given number into the current player selected cells array " do 
    expect(game.updates_player_cells(6)).to eql([6])
  end
  it "Add the given number into the current player selected cells array " do 
    expect(game.updates_player_cells(7)).to eql([6, 7])
  end

  it "Add the given number into the current player selected cells array " do 
    expect(game.updates_player_cells(0)).to eql([6, 7, 0])
  end
 end

 describe "#updates_player_cells" do
  game = Game.new

    it "should end the game when there is a winning condition" do 
      expect(game.check_end_game([2, 1, 0], [2, 1, 0], [3, 4, 9])).to be true
    end

   it "should end when there is no more space to play" do 
    game = Game.new
    expect(game.check_end_game([0, 2, 5, 6], [0, 2, 5, 6], [1, 3, 4, 7, 8])).to be true
   end
  end
end

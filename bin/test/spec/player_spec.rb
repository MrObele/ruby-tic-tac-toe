require './dependencies/player.rb'
describe Player do
    # build one instance of a player first
    before do
        @player = Player.new("David", "X")
    end
  
    describe 'Creates new Player' do
      context 'given a player name and shape' do
        it 'creates a player object with name and shape' do
          # Testing that player name and shape initialize correctly.
          expect([@player.name, @player.shape]).to eql(["David", "X"])
        end
      end
    end
    
  end
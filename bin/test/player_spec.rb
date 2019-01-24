require './lib/player'
describe Player do
    # build one instance of a player first
    before do
        @player = Player.new("David", "X")
    end
  
    describe 'Player' do
      context 'given a player name and shape' do
        it 'creates a player object with name and shape' do
          expect([@player.name, @player.shape]).to eql(["David", "X"])
        end

        it "provides a selection array for the initialized player" do
          expect(@player.cells_selected).to eq([])
        end
      end

      context 'when player selects a cell, it tracks it in the above array' do
        it 'pushes the index provided to its method to the array' do
          expect(@player.record_choice(9)).to eq([9])
          expect(@player.record_choice(7)).to eq([9, 7])
        end
      end
    end
    
  end
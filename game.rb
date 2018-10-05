class Player

    def initialize(name,shape)
        @shape = shape
    end

end

class Game
    def select_option 
        puts "Select your shape options: 0 or x"
        @shape = gets.homp
    end
    
    def Play 
        board(option)
       puts "" 
    end

end
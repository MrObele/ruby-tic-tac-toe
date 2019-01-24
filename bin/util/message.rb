# This Message Class will interact with the Players

class Messages
  def initialize

  end
  def ask_for_input(name)
    puts ("#{name}, Type a number between 1 and 9")
  end

  def show_board(cells)
    puts "Current Status"
      puts ""
      
      puts "#{cells[0]}  | #{cells[1]}  |  #{cells[2]}"
      puts "------------"
      puts "#{cells[3]}  | #{cells[4]}  |  #{cells[5]}"
      puts "------------"
      puts "#{cells[6]}  | #{cells[7]}  |  #{cells[8]}"
  end

  def show_map
    puts "Game Map: "
    puts ""
    puts "1|2|3"
    puts "4|5|6"
    puts "7|8|9"
  end

  def display(string)
    puts string
  end
  
  def chosen_cell
    puts ("This cell has been chosen, Please select another cell")
  end
 
  def collect() 
    gets.chomp
  end
end
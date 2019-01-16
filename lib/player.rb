
# This is the Player Class, it will be initialized by the instance of the Game Class
class Player
  attr_accessor :shape, :name, :cells_selected
  def initialize(name, shape)
      @name = name
      @shape = shape
      @cells_selected = []
  end
end

class Tile
  attr_accessor :is_bomb, :num_adjacent_bombs

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
  end

end

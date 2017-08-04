require 'byebug'

class Board
  attr_accessor :grid

  def initialize(dims = [9, 9], difficulty = 1) # 1 through 3
    @size = dims.first * dims.last
    @grid = create_tiles(dims, difficulty)
  end

  def create_tiles(dims, difficulty)
    debugger

    num_bombs = @size / (10 * difficulty)
    num_safe = @size - num_bombs

    all_tiles =  Array.new(num_safe){ Tile.new }
    all_tiles += Array.new(num_bombs){ Tile.new(true) }
    all_tiles.shuffle!

    grid = Array.new(dims.first){[]}

    grid.map do |row|
      dims.last.times { row << all_tiles.pop }
    end
    grid

  end

  def num_ajacent_bombs(row,col)
    adjacent_tiles = []
    offsets = [-1,0,1].product([-1,0,1])
    adjacents = offsets.map do |r,c|
      [row+r, col+c]
    end
    adjacents.select! do |pos|
      r,c = pos
      valid_pos(r,c) && @grid[r][c].is_bomb
    end.count
  end

  def valid_pos(row,col)
    return false if row < 0 || row == grid.count
    return false if col < 0 || col == grid[0].count
    true
  end
end

class Board
  def initialize
    @grid = Array.new(8) {Array.new(8) }
  end

  def [](pos)
    row, col = pos
    @grid[col][pos]
  end

  def []=(pos, value)
    row, col = pos
    @grid[col][pos] = value
  end

  def move(start_pos, end_pos)
    # update 2d grid and also moved pieces position
    # raise exception if start_pos has no piece; piece cannot move to end
  end

  def mark(pos)
    x, y = pos
    @grid[x][y] = # place new piece
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def rows
    @grid
  end

end

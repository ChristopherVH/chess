# require_relative "./pieces/pieces.rb"
class Board


  def initialize
    @grid = Array.new(8) {Array.new(8) {Piece.new}}
    populate
  end

  def [](pos)
    row , col = pos
    @grid[col][row]
  end

  def []=(pos, value)
    row, col = pos
    @grid[col][row] = value
  end

  def move(start_pos, end_pos)
    # update 2d grid and also moved pieces position
    # raise exception if start_pos has no piece; piece cannot move to end
  end

  def mark(pos)
    x, y = pos
    # self[x, y] = # place new piece
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def rows
    @grid
  end

  def populate
    rows.each_with_index |row, y|
      row.each_with_index |square, x|
        if row == 0 || row == 7
        elsif row == 1 || row == 6
        else
          self[]
    end
  end

end

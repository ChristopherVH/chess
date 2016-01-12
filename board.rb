require_relative "./pieces/pieces.rb"

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
          color = (row == 0 ? :b : :w)
          first_row(x,y,color)
        elsif row == 1 || row == 6
          color = (row == 1 ? :b : :w)
          self[x,y] = Pawn.new(board: self, pos: [x,y], color: color)
        else
          self[x,y] = Piece.new(board: self, pos: [x,y])
        end
    end
  end

  def first_row(x, y, color)
    case y
    when 0 || 7
      self[x,y] = Rook.new(board: self, pos: [x,y], color: color)
    when 1 || 6
      self[x,y] = Knight.new(board: self, pos: [x,y], color: color)
    when 2 || 5
      self[x,y] = Bishop.new(board: self, pos: [x,y], color: color)
    when 3
      self[x,y] = Queen.new(board: self, pos: [x,y], color: color)
    when 4
      self[x,y] = King.new(board: self, pos: [x,y], color: color)
    end
  end

end

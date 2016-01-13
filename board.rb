require_relative "./pieces/pieces.rb"
require_relative "./pieces/directory.rb"

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
    @grid.each_with_index do |row, y|
      row.each_with_index do |square, x|
        if y == 0 || y == 7
          p "Filling first row"
          color = (y == 0 ? :b : :w)
          first_row(x,y,color)
        elsif y == 1 || y == 6
          p "filling second row"
          color = (y == 1 ? :b : :w)
          @grid[y][x] = Pawn.new(board: self, pos: [x,y], color: color)
        end
      end
    end
  end

  def first_row(x, y, color)
    case x
    when 0, 7
      @grid[y][x] = Rook.new(board: self, pos: [x,y], color: color)
    when 1, 6
      @grid[y][x] = Knight.new(board: self, pos: [x,y], color: color)
    when 2, 5
      @grid[y][x] = Bishop.new(board: self, pos: [x,y], color: color)
    when 3
      @grid[y][x] = Queen.new(board: self, pos: [x,y], color: color)
    when 4
      @grid[y][x] = King.new(board: self, pos: [x,y], color: color)
    end
  end

end

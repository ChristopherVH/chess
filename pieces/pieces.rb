class Piece
  def initialize(board, color = nil, pos = nil, value = nil)
    @board = board
    @color = color
    @pos = pos
    @value = value
  end

  def to_s
    "   "
  end

  def inspect
    "   "
  end

  def moves
    #return array of valid moves
  end

  def die
    self.value, self.color = nil, nil

  end

  def kill
    # board[end].die
    # self.move(start, end)
  end

  def null_piece?
    @color.nil?
  end

end

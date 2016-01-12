class Piece
  def initialize(color = nil, pos = nil, value = nil, board = nil)
    @color = color
    @pos = pos
    @value = value
    @board = board
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

end

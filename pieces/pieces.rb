require_relative "./board.rb"

class Piece
  attr_reader :board, :color
  attr_accessor :pos, :valid_moves

  def initialize(opt = {})
    default = {board: nil, color: nil, pos: nil}
    opt = default.merge(opt)

    @board = opt[:board]
    @color = opt[:color]
    @pos = opt[:pos]
    @valid_moves = []
  end

  def symbol
    "   "
  end

  def to_s
    symbol
  end

  def inspect
    symbol
  end

  def generate_moves #TODO: Possibly redundant check
    # do something to self.valid_moves
    @valid_moves = []
  end

  def die # check me; do I get garbage collected?
    # self.board = move to "captured list / board / array"
    self.board[pos] = Piece.new(board: board, pos: pos)
  end

  # def kill(pos)
  #   board[pos].die
  # end

  def null_piece?
    @color.nil?
  end

end

require_relative 'steppingpiece.rb'


class Knight < SteppingPiece

  def symbol
    @color == :w ? " ♞ " : " ♘ "
  end

  KNIGHT =
  [
    [1,2],
    [-1,2],
    [1,-2],
    [-1,-2],
    [2,1],
    [2,-1],
    [-2,-1],
    [-2,1]
  ]

  def directions
    KNIGHT
  end

end

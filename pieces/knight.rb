require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  SCORE = 3

  include Stepable

  def symbol
    '♞'.colorize(color)
  end

  protected

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end
end

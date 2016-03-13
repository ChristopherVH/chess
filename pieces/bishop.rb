require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  SCORE = 3

  include Slideable

  def symbol
    '♝'.colorize(color)
  end

  protected

  def move_dirs
    diagonal_dirs
  end
end

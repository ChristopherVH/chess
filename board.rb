class Board
  def initialize
    @grid = Array.new(8) {Array.new(8) }
  end

  def move(start_pos, end_pos)
    # update 2d grid and also moved pieces position
    # raise exception if start_pos has no piece; piece cannot move to end
  end

end

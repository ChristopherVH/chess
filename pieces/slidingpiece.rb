require_relative 'pieces'


class SlidingPiece < Piece
  # def move - slides until it hits something or stops
  # def slide_old
  #   potential_moves.each do |step|
  #     until
  # end

  def slide
    move_hash = potential_moves
    slide_array = []
    move_hash.each do |key, value|
      blocked = false
      until blocked
        if value.in_bounds?
          if board[value].color.nil?
            slide_array << value # if passes tests
            move_hash[key] = [value.first + key.first, value.last + key.last]
          else
            slide_array << value unless board[value].color == self.color
            blocked = true
          end
        else
          blocked = true
        end
      end
    end
    slide_array
  end

  def get_valid_moves
    @valid_moves = slide
  end
end

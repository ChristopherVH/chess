require_relative 'pieces'


class SlidingPiece < Piece
  # def move - slides until it hits something or stops
  # def slide_old
  #   potential_moves.each do |step|
  #     until
  # end

  def slide
    move_hash = potential_moves
    move_hash.each do |key, value|
      blocked = false
      until blocked
        if value.valid?
          @valid_moves << value # if passes tests
          move_hash[key] = [value.first + key.first, value.last + key.last]
        else
          blocked = true

        end
  end

    # next, run potential_moves through filters
    # 1. in_bounds?(move)
    # 2. occupied?(move)
    #    a. board[move]color = self.color? then add
    #    b. board[move]color = enemy.color?

  end
end

self.pos = [5,5]
move_hash = {
  [ 1, 0] =>
  [-1, 0] =>
  [ 0, 1] =>
  [ 0,-1] =>

}


blocked = true

if in bounds & no one here -> @valid_moves << value; value = key + value; blocked still false so loops
if out of bounds -> blocked = true; stop loops
if in bounds @ someone here -> blocked = true
  if someone = own color ->
  else someone = enemy -> @valid_moves << value

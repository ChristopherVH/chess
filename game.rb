require_relative "board.rb"
require_relative "display.rb"
require_relative "player.rb"

class Game

  attr_reader :display

  def initialize(p1, p2)
    @display = Display.new
    @p1, @p2 = p1, p2
    @current_player = p1
  end

  def switch_player!
    @current_player = (@current_player == p1 ? p2 : p1)
  end

  def run_game
    display('clear')

    until over?
      display.select_piece
      # player.select_piece
      switch_player!
    end

  end


end

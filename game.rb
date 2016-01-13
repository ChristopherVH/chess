require_relative "board.rb"
require_relative "display.rb"
require_relative "player.rb"

class Game

  attr_reader :display

  def initialize(p1 = Player.new("White", :w), p2 = Player.new("Black", :b))
    @display = Display.new
    @p1, @p2 = p1, p2
    @current_player = p1
  end

  def switch_player!
    @current_player = (@current_player == p1 ? p2 : p1)
  end

  def run_game
    # display('clear')
    display.render
    p "???"
    while true
      p "test"
      display.select_piece
      # player.select_piece
      switch_player!
      display.render
    end

  end


end

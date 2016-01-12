class Game

  attr_reader :display

  def initialize(display)
    @display = display
    @current_color = :w
  end

  def switch_color!
    @current_color = (@current_color == :w ? :b : :w)
  end

  def run_game
    display('clear')
    until over?
      #display.select_piece
      switch_color!
    end
  end
end

module LightsOut
  require 'htrb'

  require_relative './board'
  require_relative './win'

  class GamePage < HTRB::Component
    def render
      board = props[:board]

      if (board.win?)
        _win! board: board
      else
        _board! board: board
      end
    end
  end
end

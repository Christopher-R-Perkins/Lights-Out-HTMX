module LightsOut
  require 'htrb'

  require_relative './button'
  require_relative './moves'
  require_relative './seed'
  require_relative './new_game'

  class Board < HTRB::Component
    def render
      board = props[:board]

      figure! class: 'board', id: 'board' do
        board.each_with_index do |light, idx|
          _button! on: light, index: idx
        end

        figcaption! do
          _seed! value: board.initial_seed
          _moves! value: board.moves
          _newgame!
        end
      end
    end
  end
end

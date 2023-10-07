module LightsOut
  require 'htrb'

  require_relative './button'
  require_relative './moves'
  require_relative './seed'
  require_relative './newgame'

  class Board < HTRB::Component
    def render
      board = props[:board]
      seed = board.initial_seed
      moves = board.moves

      figure! class: 'board' do
        board.each_with_index do |light, idx|
          _button! on: light, index: idx
        end

        figcaption! do
          _seed! value: seed
          _moves! value: moves
          _newgame!
        end
      end
    end
  end
end

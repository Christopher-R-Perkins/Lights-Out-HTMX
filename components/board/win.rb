module LightsOut
  require 'htrb'

  require_relative './moves'
  require_relative './seed'
  require_relative './new_game'

  class Win < HTRB::Component
    def render
      board = props[:board]

      div! id: 'board', hx_swap_oob: true do
        h2! { t! "You Won!" }
        ul! class: 'win' do
          li! { _moves! value: board.moves }
          li! { _seed! value: board.initial_seed }
          li! { _newgame! }
        end
      end
    end
  end
end

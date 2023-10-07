module LightsOut
  require 'htrb'

  require_relative '../../lib/game'

  class NewGame < HTRB::Component
    def render
      seed = Game.random_seed

      dl! hx_post: "/new/#{seed}",
          hx_swap: 'innerHTML',
          hx_target: 'main' do
        dt! do
          t! 'New Game:'
        end

        dd! do
          span! do
            t! seed
          end
        end
      end
    end
  end
end

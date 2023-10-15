module LightsOut
  require 'htrb'

  require_relative '../../lib/game'

  class NewGame < HTRB::Component
    def render
      url = "/new/#{Game.random_seed}"

      dl! do
        dt! do
          t! 'New Game:'
        end

        dd! do
          a! hx_post: url,
             hx_swap: 'innerHTML',
             hx_target: 'main',
             class: 'button',
             href: url do
            t! 'Random Seed'
          end
        end
      end
    end
  end
end

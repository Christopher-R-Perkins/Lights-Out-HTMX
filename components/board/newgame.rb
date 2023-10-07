module LightsOut
  require 'htrb'

  require_relative '../../lib/game'

  class NewGame < HTRB::Component
    def render
      seed = Game.random_seed

      dl! do
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

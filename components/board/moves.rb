module LightsOut
  require 'htrb'

  class Moves < HTRB::Component
    def render
      value = props[:value]

      dl! id: 'moves', hx_swap_oob: props[:out_of_band] do
        dt! do
          t! 'Moves:'
        end

        dd! do
          t! value
        end
      end
    end
  end
end

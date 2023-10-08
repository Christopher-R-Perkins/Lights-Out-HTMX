module LightsOut
  require 'htrb'

  class Moves < HTRB::Component
    def render
      value = props[:value]

      attributes = { id: 'moves' }
      attributes[:hx_swap_oob] = true if props[:out_of_band]

      dl! **attributes do
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

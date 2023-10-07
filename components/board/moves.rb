module LightsOut
  require 'htrb'

  class Moves < HTRB::Component
    def render
      value = props[:value]

      dl! do
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

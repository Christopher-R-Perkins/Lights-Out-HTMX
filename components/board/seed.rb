module LightsOut
  require 'htrb'

  class Seed < HTRB::Component
    def render
      value = props[:value]

      dl! do
        dt! do
          t! 'Initial Seed:'
        end

        dd! do
          span! do
            t! value
          end
        end
      end
    end
  end
end

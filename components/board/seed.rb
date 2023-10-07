module LightsOut
  require 'htrb'

  class Seed < HTRB::Component
    def render
      value = props[:value]

      dl! hx_post: "/new/#{value}",
          hx_swap: 'innerHTML',
          hx_target: 'main' do
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

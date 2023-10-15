module LightsOut
  require 'htrb'

  class Seed < HTRB::Component
    def render
      value = props[:value]
      url = "/new/#{value}"

      dl!  do
        dt! do
          t! 'Initial Seed:'
        end

        dd! do
          a! hx_post: url,
             hx_swap: 'innerHTML',
             hx_target: 'main',
             class: 'button',
             href: url do
            t! value
          end
        end
      end
    end
  end
end

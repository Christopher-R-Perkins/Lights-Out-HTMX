module LightsOut
  require 'htrb'

  class Seed < HTRB::Component
    def render
      url = "/new/#{props[:value]}"
      value = props[:value]

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

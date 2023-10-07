module LightsOut
  require 'htrb'

  class Button < HTRB::Component
    def render
      index = props[:index]
      attributes = {
        class: "light #{props[:on] ? 'on' : ''}",
        id: "light-#{index}",
        hx_put: "/move",
        hx_swap: 'outerHTML',
        hx_include: "this",
      }

      attributes[:hx_swap_oob] = true if props[:out_of_band]

      div! **attributes do
        input! type: 'hidden', value: index, name: 'move'
      end
    end
  end
end

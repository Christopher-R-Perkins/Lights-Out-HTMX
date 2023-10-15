module LightsOut
  require 'htrb'

  class Button < HTRB::Component
    def render
      index = props[:index]
      attributes = {
        class: "button light #{props[:on] ? 'on' : ''}",
        id: "light-#{index}",
        hx_put: "/move",
        hx_swap: 'outerHTML',
        hx_vals: "{\"move\": #{index}}",
      }

      attributes[:hx_swap_oob] = true if props[:out_of_band]

      div! **attributes
    end
  end
end

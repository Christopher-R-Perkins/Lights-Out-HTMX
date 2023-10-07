module LightsOut
  require 'htrb'

  class Button < HTRB::Component
    def render
      div! class: "light #{props[:on] ? 'on' : ''}",
           id: "light-#{props[:index]}"
    end
  end
end

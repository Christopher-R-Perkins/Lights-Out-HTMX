module LightsOut
  require 'htrb'

  class Header < HTRB::Component
    def render
      header!
      h1! do
        t! 'Blink Out'
      end
    end
  end
end

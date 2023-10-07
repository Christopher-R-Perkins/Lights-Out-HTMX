module LightsOut
  require 'htrb'

  class Footer < HTRB::Component
    def render
      p! do
        t! 'Blink Out('
        a! href: 'https://github.com/QuasariNova/lights-out-htmx' do
          t! 'Github'
        end

        t! ') by Christopher Perkins'
      end

      p! do
        t! 'Special Thanks to '
        a! href: 'www.launchschool.com' do
          t! 'Launch School'
        end
      end
    end
  end
end

module LightsOut
  require 'htrb'

  require_relative './header'
  require_relative './footer'

  class Layout < HTRB::Component
    def render(&content)
      _header!

      main! do
        remit &content if block_given?
      end

      _footer!
    end

    def self_closing?
      false
    end
  end
end

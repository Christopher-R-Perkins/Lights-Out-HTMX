require 'sinatra'
require 'htrb'

require_relative './components/layout/layout'
require_relative './components/board/board'
require_relative './lib/game'

configure do
  enable :sessions
end

before do
  unless session[:lights_out]
    session[:lights_out] = LightsOut::Game.new LightsOut::Game.random_seed
  end
  @board = session[:lights_out]
end

get '/' do
  head = proc do
    link! rel: 'stylesheet', href: '/css/reset.css'
    link! rel: 'stylesheet', href: '/css/application.css'
  end

  board = @board

  HTRB.document title: 'Blink Out HTMX', head: head do
    _layout! do
      _board! board: board
    end
  end.to_s
end

require 'sinatra'
require 'htrb'

require_relative './components/layout/layout'
require_relative './components/pages/game_page'
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

def won?
  @board.win?
end

get '/' do
  head = proc do
    link! rel: 'stylesheet', href: '/css/reset.css'
    link! rel: 'stylesheet', href: '/css/application.css'
    script! src: 'https://unpkg.com/htmx.org@1.9.6',
            integrity: 'sha384-FhXw7b6AlE/jyjlZH5iHa/tTe9EpJ1Y55RjcgPbjeWMskSxZt1v9qkxLJWNJaGni',
            crossorigin: 'anonymous'
  end

  board = @board

  HTRB.document title: 'Blink Out HTMX', head: head do
    _layout! do
      _gamepage! board: board
    end
  end.to_s
end

put '/move' do
  move = params['move'].to_i
  changes = @board.move! move
  board = @board

  if won?
    response['HX-Retarget'] = 'main'
    response['HX-Reswap'] = 'innerHTML'
    return HTRB.html { _gamepage! board: board }
  end

  HTRB.html do
    changes.each do |index|
      _button! index: index,
               out_of_band: index != move,
               on: board[index]
    end

    _moves! value: board.moves, out_of_band: true
  end
end

post '/new/:seed' do
  board = LightsOut::Game.new params[:seed]
  session[:lights_out] = board

  HTRB.html do
    _board! board: board
  end
end

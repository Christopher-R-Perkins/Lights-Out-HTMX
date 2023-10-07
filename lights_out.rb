require 'sinatra'
require 'htrb'

require_relative './components/layout/layout'

configure do
  enable :sessions
end

get '/' do
  HTRB.document title: 'Blink Out HTMX' do
    _layout!
  end.to_s
end

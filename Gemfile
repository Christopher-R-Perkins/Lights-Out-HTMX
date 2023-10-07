ruby '3.2.2'

source 'https://rubygems.org'

gem 'sinatra'
gem 'htrb'

group :production do
  gem 'puma'
end

group :development do
  gem 'minitest'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem 'rerun'
end

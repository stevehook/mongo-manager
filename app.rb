require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'

class App < Sinatra::Base
  set :static, true
  # set :public, 'public'

  helpers do
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
  end

  get '/' do
    'hello'
  end

  run! if /app.rb$/ =~ $0
end

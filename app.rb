require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'
require 'coffee-script'

class CoffeeHandler < Sinatra::Base
  set :views, 'public/coffee'

  get "/coffee/*.coffee" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class App < Sinatra::Base
  use CoffeeHandler

  set :static, true
  set :public, 'public'

  helpers do
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
  end

  get '/' do
    haml :index
  end

  run! if /app.rb$/ =~ $0
end

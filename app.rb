require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'
require 'coffee-script'

module Partials
  def partial( page, variables={} )
    haml page.to_sym, {layout:false}, variables
  end
end

class CoffeeHandler < Sinatra::Base
  set :views, 'public/coffee'

  get "/coffee/*.coffee" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class App < Sinatra::Base
  use CoffeeHandler
  helpers Partials

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

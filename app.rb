require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'
require 'coffee-script'
require 'json'

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

  get '/databases' do
    # TODO: Refactor the following code into a separate 'model' class
    [{ name: 'database 1' }, { name: 'database 2' }, { name: 'database 3' }].to_json
  end

  run! if /app.rb$/ =~ $0
end

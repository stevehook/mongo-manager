require 'sinatra/base'
require 'sinatra/reloader'
require 'haml'
require 'coffee-script'
require 'json'
require 'mongo'

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

class MongoServer
  # For now we are only going to support a single server (localhost)
  def connection
    # TODO: More efficient mechanism to handle connections?
    Mongo::Connection.new
  end

  def databases
    connection.database_names.map { |db_name| { id: db_name, name: db_name } }
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

  get '/databases/:id/collections' do
    # TODO: Get some real data from mongodb
    # TODO: Refactor the following code into a separate 'model' class
    content_type 'application/json'
    [{ _id: 1, name: 'collection 1' }, { _id: 2, name: 'collection 3' }, { _id: 3, name: 'collection 3' }].to_json
  end

  get '/databases' do
    # TODO: Get some real data from mongodb
    # TODO: Refactor the following code into a separate 'model' class
    content_type 'application/json'
    MongoServer.new.databases.to_json
  end

  run! if /app.rb$/ =~ $0
end


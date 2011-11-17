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
    connection.database_names.map do |db_name| 
      database = connection.db(db_name)
      {
        id: db_name,
        name: db_name,
        collectionCount: database.stats['collections'],
        documentCount: database.stats['objects'],
        dataSize: database.stats['dataSize'],
        storageSize: database.stats['storageSize'],
        numExtents: database.stats['numExtents'],
        indexCount: database.stats['indexes'],
        indexSize: database.stats['indexSize'],
        fileSize: database.stats['fileSize']
      }
    end
  end

  def collections(database_name)
    db = connection.db(database_name)
    db.collection_names.map do |collection_name|
      collection = db.collection(collection_name)
      {
        id: collection_name,
        name: collection_name,
        documentCount: collection.stats['count'],
        size: collection.stats['size'],
        storageSize: collection.stats['storageSize'],
        indexCount: collection.stats['nindexes'],
        indexSize: collection.stats['totalIndexSize']
      }
    end
  end

  def databases_and_collections(database_name)
    dbs = databases
    selected_db = dbs.find { |db| db[:name] == database_name }
    selected_db[:collections] = collections(database_name)
    dbs
  end

  def get_documents(database_name, collection_name, skip = 0, limit = 0)
    db = connection.db(database_name)
    collection = db.collection(collection_name)
    params = {}
    params[:skip] = skip if skip != 0
    params[:limit] = limit if limit != 0
    collection.find(params).to_a
  end
end

class App < Sinatra::Base
  use CoffeeHandler
  helpers Partials

  set :static, true
  set :public_folder, 'public'

  helpers do
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
  end

  get '/' do
    @databases = MongoServer.new.databases.to_json
    haml :index
  end

  get '/databases/:database_id/collections/:collection_id/documents' do |database_id, collection_id|
    limit = request.params[:limit]
    skip = request.params[:skip]
    @databases = MongoServer.new.databases_and_collections(database_id).to_json
    @data = MongoServer.new.get_documents(database_id, collection_id, skip, limit).to_json
    if request.xhr?
      content_type 'application/json'
      @data
    else
      haml :index
    end
  end

  get '/databases/:id' do |id|
    @databases = MongoServer.new.databases.to_json
    haml :index
  end

  get '/databases/:database_id/collections/:collection_id' do |database_id, collection_id|
    @databases = MongoServer.new.databases_and_collections(database_id).to_json
    haml :index
  end

  get '/databases/:id/collections' do |id|
    content_type 'application/json'
    MongoServer.new.collections(id).to_json
  end

  get '/databases' do
    content_type 'application/json'
    MongoServer.new.databases.to_json
  end

  run! if /app.rb$/ =~ $0
end


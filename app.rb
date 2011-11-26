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
    params[:skip] = skip
    params[:limit] = limit
    collection.find(nil, params).to_a
  end

  def get_count(database_name, collection_name)
    db = connection.db(database_name)
    collection = db.collection(collection_name)
    collection.count
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

  get '/databases/:database_id/collections/:collection_id/documents/?:page_size?/?:page?' do |database_id, collection_id, page_size, page|
    page_size = params[:page_size]
    page = params[:page]
    limit = page_size ? page_size.to_i : 20
    skip = page ? (page.to_i - 1) * limit : 0
    mongo_server = MongoServer.new
    data = mongo_server.get_documents(database_id, collection_id, skip, limit)
    count = data.length < limit && skip == 0 ? data.length : mongo_server.get_count(database_id, collection_id)
    if request.xhr?
      content_type 'application/json'
      { :count => count, :page => skip + 1, :pageSize => limit, :models => data }.to_json
    else
      @data = data.to_json
      @databases = MongoServer.new.databases_and_collections(database_id).to_json
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


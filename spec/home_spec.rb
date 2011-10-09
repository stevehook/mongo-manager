require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "home" do
  include Rack::Test::Methods

  context "when viewing root" do
    it "should return the correct content-type" do
      get '/'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end
  end

  context "when fetching /databases" do
    before(:each) do
      @database_names = %w{ accounts human_resources it_support}
      @mongo_server_stub = stub('fake_mongo_server')
      MongoServer.stub(:new).and_return(@mongo_server_stub)
      @mongo_server_stub.stub(:databases).and_return(@database_names.map { |name| { id: name, name: name } })
    end

    it "should return the correct content-type" do
      get '/databases'
      last_response.headers["Content-Type"].should =~ /application\/json/
    end

    it "should return a list of database names" do
      get '/databases'
      expected_body = @database_names.map { |name| { id: name, name: name } }.to_json
      last_response.body.should == expected_body
    end

    context "when fetching /databases/accounts/collections" do
      before(:each) do
        @collection_names = %w{ orders order_items customers products suppliers }
        @mongo_server_stub = stub('fake_mongo_server')
        MongoServer.stub(:new).and_return(@mongo_server_stub)
        @mongo_server_stub.stub(:collections).and_return(@collection_names.map { |name| { id: name, name: name } })
      end

      it "should return the correct content-type" do
        get '/databases/accounts/collections'
        last_response.headers["Content-Type"].should =~ /application\/json/
      end

      it "should return a list of collection names" do
        get '/databases/accounts/collections'
        expected_body = @collection_names.map { |name| { id: name, name: name } }.to_json
        last_response.body.should == expected_body
      end
    end
  end

  context "when navigating to a specific database" do
    before(:each) do
      @database_names = %w{ accounts human_resources it_support}
      @mongo_server_stub = stub('fake_mongo_server')
      MongoServer.stub(:new).and_return(@mongo_server_stub)
      @mongo_server_stub.stub(:databases).and_return(@database_names.map { |name| { id: name, name: name } })
    end

    it "should return the correct content type" do
      get '/databases/accounts'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end

    it "should pre-populate the databases collection in generated JS" do
      get '/databases/accounts'
      last_response.body.should match /window.databases.reset/
      last_response.body.should match /"id":"accounts"/
      last_response.body.should match /"id":"human_resources"/
      last_response.body.should match /"id":"it_support"/
      last_response.body.should_not match /"id":"marketing"/
    end
  end

  context "when navigating to a specific collection" do
    before(:each) do
      @database_names = %w{ accounts human_resources it_support}
      @collection_names = %w{ orders order_items customers products suppliers }
      @mongo_server_stub = stub('fake_mongo_server')
      MongoServer.stub(:new).and_return(@mongo_server_stub)
      @databases = @database_names.map { |name| { id: name, name: name } }
      @databases[1][:collections] = @collection_names.map { |name| { id: name, name: name } }
      @mongo_server_stub.stub(:databases).and_return(@databases)
    end

    it "should return the correct content type" do
      get '/databases/accounts/collections/customers'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end

    it "should pre-populate the databases collection in generated JS" do
      get '/databases/accounts/collections/customers'
      last_response.body.should match /window.databases.reset/
      last_response.body.should match /"id":"accounts"/
      last_response.body.should match /"id":"human_resources"/
      last_response.body.should match /"id":"it_support"/
      last_response.body.should match /"collections":/
      last_response.body.should match /"id":"orders"/
      last_response.body.should match /"id":"order_items"/
      last_response.body.should match /"id":"customers"/
      last_response.body.should_not match /"id":"marketing"/
    end
  end
end

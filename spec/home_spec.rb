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
      @connection_stub = stub('fake_connection')
      @connection_stub.stub(:database_names).and_return(@database_names)
      Mongo::Connection.stub(:new).and_return(@connection_stub)
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
        @database_stub = stub('fake_database')
        @connection_stub.stub(:db).and_return(@database_stub)
        @collection_names = %w{ orders order_items customers products suppliers }
        @database_stub.stub(:collection_names).and_return(@collection_names)
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
end

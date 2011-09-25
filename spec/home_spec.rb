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
      @database_names = ['accounts', 'human_resources', 'it_support']
      connection_stub = stub('fake_connection')
      connection_stub.stub(:database_names).and_return(@database_names)
      Mongo::Connection.stub(:new).and_return(connection_stub)
    end

    it "should return the correct content-type" do
      get '/databases'
      last_response.headers["Content-Type"].should =~ /application\/json/
    end

    it "should return a list of database names" do
      get '/databases'
      # TODO: Meaningful assertions
      expected_body = @database_names.map { |name| { id: name, name: name } }.to_json
      last_response.body.should == expected_body
    end
  end

  context "when fetching /databases/accounts/collections" do
    before(:each) do
      connection_stub = stub('fake_connection')
      connection_stub.stub(:database_names).and_return(['accounts', 'human_resources', 'it_support'])
      Mongo::Connection.stub(:new).and_return(connection_stub)
    end

    it "should return the correct content-type" do
      get '/databases/accounts/collections'
      last_response.headers["Content-Type"].should =~ /application\/json/
    end

    it "should return a list of collection names" do
      get '/databases/accounts/collections'
      # TODO: Meaningful assertions
      puts last_response.body
    end
  end
end

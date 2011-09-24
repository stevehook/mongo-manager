require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "home" do
  include Rack::Test::Methods

  context "when viewing root" do
    it "should return the correct content-type" do
      get '/'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end
  end

  context "when viewing /databases" do
    before(:each) do
      connection_stub = stub('fake_connection')
      connection_stub.stub(:database_names).and_return(['accounts', 'human_resources', 'it_support'])
      Mongo::Connection.stub(:new).and_return(connection_stub)
    end

    it "should return the correct content-type" do
      get '/databases'
      last_response.headers["Content-Type"].should =~ /application\/json/
    end

    it "should return a list of database names" do
      get '/databases'
      # TODO: Meaningful assertions
      puts last_response.body
    end
  end
end

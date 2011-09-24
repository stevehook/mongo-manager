require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "home" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  context "when viewing root" do
    it "should return the correct content-type" do
      get '/'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end
  end

  context "when viewing /databases" do
    before(:each) do
      # TODO: Need to mock Mongo::Connection
    end

    it "should return the correct content-type" do
      get '/databases'
      last_response.headers["Content-Type"].should =~ /text\/html/
    end

    it "should return a list of database names" do
      
    end
  end
end

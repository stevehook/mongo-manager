require_relative '../app.rb'
require 'rack/test'

App.set :environment, :test

def app
  @app ||= App
end


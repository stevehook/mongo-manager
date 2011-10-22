##Summary

Mongo Manager is a simple Web application for viewing the contents of a
MongoDB instance. At this time it allows you to browse the databases and
collections and their properties in the local MongoDB instance.

The server-side is a Ruby Sinatra application with a backbone.js front
end, written in CoffeeScript.

##Setup

Prerequisites: Ruby 1.9.2 and MongoDB. 

Clone the repository and install gem dependencies with bundler, start MongoDB, 
then start the server:

    # bundle install
    # ruby app.rb

Then point your browser at:

    http://localhost:4567

The client-side code is written in CoffeeScript. For development you
will need an installation of node.js with the CoffeeScript package.
There is a watchr file to build the CoffeeScript source files.

    # watchr coffee.watchr

## Roadmap

At present the application 

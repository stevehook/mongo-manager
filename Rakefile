require 'rubygems'
#require 'bundler/setup'
require 'coffee-script'

namespace :js do
  desc "compile coffee-scripts from ./src to ./public/views"
  task :compile do
    source = "#{File.dirname(__FILE__)}/public/coffee/"
    javascripts = "#{File.dirname(__FILE__)}/public/javascript/"
    
    Dir.foreach(source) do |coffee_file|
      if coffee_file =~ /\.coffee$/
        puts "Compiling #{source}#{coffee_file}"
        system "coffee -c -o #{javascripts} #{source}#{coffee_file}"
        # js = CoffeeScript.compile File.read("#{source}#{cf}") 
        # open "#{javascripts}#{cf.gsub('.coffee', '.js')}", 'w' do |f|
        #   f.puts js
        # end 
      end 
    end
  end
end


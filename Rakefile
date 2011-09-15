require 'rubygems'
#require 'bundler/setup'
require 'coffee-script'

def compile_directory(source, javascripts)
  puts source
  Dir.entries(source).each do |coffee_file|
    puts "#{coffee_file}#{File.directory?(coffee_file)}"
    if coffee_file =~ /\.coffee$/
      puts "Compiling #{source}#{coffee_file}"
      system "coffee -c -o #{javascripts} #{source}#{coffee_file}"
    elsif File.directory?("#{source}#{coffee_file}/") && coffee_file != '.' && coffee_file != '..'
      compile_directory("#{source}#{coffee_file}/", "#{javascripts}#{coffee_file}/")
    end 
  end
end

namespace :js do
  desc "compile coffee-scripts from ./src to ./public/views"
  task :compile do
    source = "#{File.dirname(__FILE__)}/public/coffee/"
    javascripts = "#{File.dirname(__FILE__)}/public/javascript/"
    compile_directory(source, javascripts)
  end
end


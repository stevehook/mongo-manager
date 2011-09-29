require 'rubygems'
#require 'bundler/setup'
require 'coffee-script'

def compile_directory(source, javascripts, view)
  Dir.entries(source).each do |coffee_file|
    if coffee_file =~ /\.coffee$/
      puts "Compiling #{source}#{coffee_file}"
      system "coffee -c -o #{javascripts} #{source}#{coffee_file}"
      js_file = "#{javascripts}#{coffee_file}".gsub(/\.coffee$/, '.js').gsub(/^.*\/public\/javascript/, '/javascript')
      view << "%script{ :src => '#{js_file}', :type => 'text/javascript' }\n"
    elsif File.directory?("#{source}#{coffee_file}/") && coffee_file != '.' && coffee_file != '..'
      compile_directory("#{source}#{coffee_file}/", "#{javascripts}#{coffee_file}/", view)
    end 
  end
end

namespace :js do
  desc "compile coffee-scripts from ./src to ./public/views"
  task :compile do
    source = "#{File.dirname(__FILE__)}/public/coffee/"
    javascripts = "#{File.dirname(__FILE__)}/public/javascript/"
    view = ''
    compile_directory(source, javascripts, view)
    # File.open("#{File.dirname(__FILE__)}/views/scripts.haml", 'w+') do |file|
    #   file.puts view
    # end
  end
end

task :default => ['js:compile']


begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

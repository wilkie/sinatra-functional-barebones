require 'sinatra'
require 'mongo_mapper'

class Application < Sinatra::Base
  # Use HTML5
  set :haml, :format => :html5
end

%w(config helpers controllers models).each do |dir|
    Dir[File.join(File.dirname(__FILE__), dir, '*.rb')].each {|file| require file }
end

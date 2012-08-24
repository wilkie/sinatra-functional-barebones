require 'bundler'
Bundler.require

require_relative './application'

class Application < Sinatra::Base
  configure :test do
    MongoMapper.database = "application_test"
  end

  configure :development do
    MongoMapper.database = "application_development"
  end
end

require_relative '../config/environment'

Bundler.require(:test)

require 'minitest/autorun'

module TestHelper
  def setup
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

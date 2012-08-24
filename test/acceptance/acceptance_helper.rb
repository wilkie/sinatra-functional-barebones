require_relative '../../lib/application'
require_relative '../test_helper'

module AcceptanceHelper
  include Capybara::DSL
  include Rack::Test::Methods
  include TestHelper

  Capybara.app = Application

  def teardown
    super
    Capybara.reset_sessions!
  end
end

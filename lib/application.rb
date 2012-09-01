require_relative '../config/environment'

class Application < Sinatra::Base
  # Use root directory as root
  set :app_file => '.'

  # Use HTML5
  set :haml, :format => :html5

  # Helpers
  helpers Sinatra::ContentFor

  helpers do
    def has_feature?(feature)
      Application::Features.constants.include? "#{feature}".upcase.to_sym
    end
  end

  def self.load_tasks
    Dir[File.join(File.dirname(__FILE__), "tasks", '*.rb')].each do |file|
      require file
    end
  end
end

%w(config helpers controllers models).each do |dir|
    Dir[File.join(File.dirname(__FILE__), "../#{dir}", '*.rb')].each {|file| require file }
end

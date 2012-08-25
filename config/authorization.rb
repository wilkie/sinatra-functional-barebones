class Application < Sinatra::Base
  use Rack::Session::Cookie

  use OmniAuth::Builder do
    providers = ENV['authorization_providers']
    if providers
      ENV['authorization_providers'].split.each do |service|
        provider service.to_sym,
          ENV["authorization_#{service}_id"],
          ENV["authorization_#{service}_secret"],
          :callback_path => "/auth/#{service}/callback"
      end
    end
  end
end

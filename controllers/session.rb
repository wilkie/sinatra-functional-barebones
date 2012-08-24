class Application
  get '/login' do
    @providers = []
    ENV['authorization_providers'].split.each do |provider|
      @providers << {:url => "/auth/#{provider}", :name => provider}
    end
    haml :"session/login"
  end

  get '/logout' do
    session[:user_id] = nil
    session[:user_token] = nil
    session[:provider] = nil

    redirect '/'
  end
end

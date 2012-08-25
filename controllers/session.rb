class Application
  get '/login' do
    @providers = []
    ENV['authorization_providers'].split.each do |provider|
      if has_feature? :"login_#{provider.downcase}"
        @providers << {:url => "/auth/#{provider}", :name => provider}
      end
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

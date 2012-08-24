class Application
  get '/login' do
    @providers = []
    ENV['authorization_providers'].split.each do |provider|
      if Application.constants.include?(:"ALLOW_#{provider.upcase}_SIGNUP")
        @providers << {:url => "/auth/#{provider}", :name => provider}
      end
    end
    haml :"session/login"
  end

  post '/login' do
    user = User.first(:name => params['name'])
    if user.authenticated?(params['password'])
      session[:user_id]    = user.id
      session[:user_token] = nil
      session[:provider]   = nil

      redirect '/'
    else
    end
  end

  get '/logout' do
    session[:user_id] = nil
    session[:user_token] = nil
    session[:provider] = nil

    redirect '/'
  end
end

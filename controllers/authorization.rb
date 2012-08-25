class Application
  get '/auth/twitter/callback' do
    auth = request.env['omniauth.auth']

    twitter = TwitterInfo.first(:uid => auth['uid'].to_i)
    if twitter
      twitter.update_with_omniauth(auth)
    else
      twitter = TwitterInfo.create_with_omniauth(auth)
    end

    unless twitter.user
      if Application::ALLOW_TWITTER_SIGNUP
        twitter.user = User.create(:name => twitter.nickname,
                                   :bio  => twitter.description,
                                   :twitter_info => twitter)
        twitter.save
      end
    end

    unless logged_in?
      session[:user_id]    = twitter.user.id
      session[:user_token] = auth['credentials']['token']
      session[:provider]   = :twitter
    end

    session[:twitter_secret] = auth['credentials']['secret']
    session[:twitter_token]  = auth['credentials']['token']

    redirect '/'
  end

  # %%DELETE%% github

  # %%DELETE%% facebook

  # %%DELETE%% steam
end

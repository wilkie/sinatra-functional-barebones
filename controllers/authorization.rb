class Application
  get '/auth/twitter/callback' do
    auth = request.env['omniauth.auth']

    twitter = TwitterInfo.first(:uid => auth['uid'].to_i)
    if twitter
      twitter.update_with_omniauth(auth)
    else
      twitter = TwitterInfo.create_with_omniauth(auth)
    end

    session[:twitter_secret] = auth['credentials']['secret']
    session[:twitter_token]  = auth['credentials']['token']

    redirect '/'
  end

  # %%DELETE%% github

  # %%DELETE%% facebook

  # %%DELETE%% steam
end

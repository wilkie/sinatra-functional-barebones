class Application
  # %%DELETE%% twitter

  get '/auth/github/callback' do
    auth = request.env['omniauth.auth']

    github = GithubInfo.first(:uid => auth['uid'].to_i)
    if github
      github.update_with_omniauth(auth)
    else
      github = GithubInfo.create_with_omniauth(auth)
    end

    unless github.user
      if Application::ALLOW_GITHUB_SIGNUP
        github.user = User.create(:name => github.login,
                                  :bio  => github.bio,
                                  :github_info => github)
        github.save
      end
    end

    unless logged_in?
      session[:user_id]    = github.user.id
      session[:user_token] = auth['credentials']['token']
      session[:provider]   = :github
    end

    session[:github_token] = auth['credentials']['token']

    redirect '/'
  end
 
  # %%DELETE%% facebook

  # %%DELETE%% steam
end

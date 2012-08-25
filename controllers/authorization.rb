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

    session[:github_token] = auth['credentials']['token']

    redirect '/'
  end
 
  # %%DELETE%% facebook

  # %%DELETE%% steam
end

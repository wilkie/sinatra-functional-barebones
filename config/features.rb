# A list of all merged features

class Application < Sinatra::Base
  module Features
    # %%DELETE%% login
    LOGIN = true
    # %%DELETE%% authorization
    AUTHORIZATION = true
    # %%DELETE%% login-github
    LOGIN_GITHUB = true
    # %%DELETE%% login-twitter
    # %%DELETE%% login-facebook
    # %%DELETE%% login-steam
    # %%DELETE%% omniauth-github
    AUTHORIZATION_GITHUB = true
    # %%DELETE%% omniauth-twitter
    # %%DELETE%% omniauth-facebook
    # %%DELETE%% omniauth-steam
    # %%DELETE%% views-bootstrap
    # %%DELETE%% views-jquery
    # %%DELETE%% views-skeleton
  end
end

class Application < Sinatra::Base
  # Application specific flags and such go here
  
  # Whether or not there is a login functionality
  REQUIRE_LOGIN = true

  # %%DELETE%% twitter

  # %%DELETE%% github
  # GitHub --------------------------------------------------------------------

  # Whether or not any interaction with twitter requires an authorization per
  #  session, or, when off, oauth tokens are stored.
  ALWAYS_REQUIRE_GITHUB_AUTH = true

  # Whether or not one can create a new user with an authorization.
  ALLOW_GITHUB_SIGNUP = true

  # %%DELETE%% facebook

  # %%DELETE%% steam

  # %%DELETE%% login
end

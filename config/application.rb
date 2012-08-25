class Application < Sinatra::Base
  # Application specific flags and such go here
  
  # Whether or not there is a login functionality
  REQUIRE_LOGIN = false

  # %%DELETE%% twitter
  # Twitter -------------------------------------------------------------------

  # Whether or not any interaction with twitter requires an authorization per
  #  session, or, when off, oauth tokens are stored.
  ALWAYS_REQUIRE_TWITTER_AUTH = true

  # %%DELETE%% github

  # %%DELETE%% facebook

  # %%DELETE%% steam

  # %%DELETE%% login
end

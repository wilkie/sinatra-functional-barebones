class Application < Sinatra::Base
  # Application specific flags and such go here
  
  # Whether or not there is a login functionality
  REQUIRE_LOGIN = true

  # %%DELETE%% omniauth

  # %%DELETE%% login
  # Password Signup -----------------------------------------------------------

  # Whether or not a password is required to be repeated to confirm
  REQUIRE_PASSWORD_CONFIRMATION = true
end

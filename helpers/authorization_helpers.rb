class Application
  module AuthorizationHelpers
    def logged_in?
      !!current_user
    end

    def current_user
      if Application::REQUIRE_LOGIN
        if session[:user_id]
          @current_user ||= User.first(:id => session[:user_id])
        end
      else
        @current_user = User.first || User.create(:name => "owner")
      end
    end
  end

  helpers AuthorizationHelpers
end

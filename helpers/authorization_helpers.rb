class Application
  module AuthorizationHelpers
    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.first(:id => session[:user_id])
      end
    end
  end

  helpers AuthorizationHelpers
end

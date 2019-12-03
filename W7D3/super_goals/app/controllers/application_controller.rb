class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :current_user_id

    def current_user
        # debugger
        return nil unless session[:session_token]
        current_user ||= User.find_by(session_token: session[:session_token])
    end

    def current_user_id
        current_user ? current_user.id : nil
    end

    def logged_in?
        !!current_user
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def require_user!
        redirect_to new_session_url if current_user.nil?
    end

    def logout!
        current_user.reset_session_token!
        self.session_token = nil
        current_user = nil
    end

end
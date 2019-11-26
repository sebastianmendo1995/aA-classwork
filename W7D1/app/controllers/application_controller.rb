class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def skip_if_logged_in
        redirect_to cats_url if logged_in? 
    end

    def ensure_ownership
        redirect_to cat_url if !current_user.cats.pluck(:id).include?(params[:id])
        true
    end

end

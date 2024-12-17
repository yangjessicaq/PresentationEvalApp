class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page."
      redirect_to new_session_path  # Redirect to the login page
    end
  end
end

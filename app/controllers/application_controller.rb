class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  private

  def authenticate_user!
    return if authenticated?

    redirect_to login_path, alert: "You must be logged in to access this page"
  end

  def current_user
    Current.user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def authenticated?
    current_user.present?
  end
  helper_method :authenticated?

  def login_as(user)
    Current.user = user

    reset_session
    session[:user_id] = user.id
  end
end

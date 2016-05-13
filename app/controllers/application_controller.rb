class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :other_user

  def set_prep
    @prep = Prep.find(params[:prep_id])
  end

  def require_user
    redirect_to home_path unless current_user
  end

  def other_user(user)
    user1 = @prep.athlete
    user2 = User.find(@prep.coach_id)
    user == user1 ? user2 : user1
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age, :height, :phone_number, :avatar, :coach])
  end
end

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # This controller should only contain publicly available functions.

  # Static home page
  def index; end

  # Static about page
  def about; end

  # Static features page
  def features; end

  # Devise uses this method to redirect after login
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_profile_path
    else
      super
    end
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(user_profile_path || root_path)
  end
end

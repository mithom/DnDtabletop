class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

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
end

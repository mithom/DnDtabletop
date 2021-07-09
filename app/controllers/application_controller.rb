class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # This controller should only contain publicly available functions.

  #Static home page
  def index;
  end

  # Static about page
  def about; end

  # Static features page
  def features; end
end

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # This controller should only contain publicly available functions.

  def index; end

  def about; end

  def features; end
end

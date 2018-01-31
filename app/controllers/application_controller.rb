class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # This controller should only contain publicly available functions.
  # For this reason, only scoping is enforced (don't see sensitive data)
  # This can be skipped with 'skip_policy_scope' if there is nothing to scope on
  after_action :verify_policy_scoped

  def index; end
end

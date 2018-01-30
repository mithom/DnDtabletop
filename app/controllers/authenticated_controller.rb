class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  def protected_index; end
end

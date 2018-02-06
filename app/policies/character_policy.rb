class CharacterPolicy < ApplicationPolicy
  def index?
    # Always true, since we know we are logged in, and everyone can access this at the moment.
    true
  end

  def show?
    # Doesn't make much sense to check embedded documents
    true
  end
end

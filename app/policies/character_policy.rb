class CharacterPolicy < ApplicationPolicy

  # TODO: configure permitted attributes with pundit (in new e.g.)
  # https://github.com/varvet/pundit#strong-parameters
  def index?
    # Always true, since we know we are logged in, and everyone can access this at the moment.
    true
  end

  def show?
    # Doesn't make much sense to check embedded documents
    true
  end

  def new?
    # As a free user, you can only have 2 characters. (probably need to be reduced to 1)
    @user.subscriber? || @user.admin? || @user.characters.count < 2
  end

  def create?
    # As a free user, you can only have 2 characters. (probably need to be reduced to 1)
    @user.subscriber? || @user.admin? || @user.characters.count < 2
  end
end

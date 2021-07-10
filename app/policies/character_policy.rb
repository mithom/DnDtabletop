class CharacterPolicy < ApplicationPolicy

  # TODO: configure permitted attributes with pundit (in new e.g.)
  # https://github.com/varvet/pundit#strong-parameters
  def index?
    # Always true, since we know we are logged in, and everyone can access this at the moment.
    true
  end

  def show?
    @user.characters.include? @record
  end

  def new?
    # As a free user, you can only have 2 characters. (probably need to be reduced to 1)
    @user.roles.subscriber? || @user.roles.admin? || @user.characters.count < 2
  end

  def create?
    # As a free user, you can only have 2 characters. (probably need to be reduced to 1)
    @user.roles.subscriber? || @user.roles.admin? || @user.characters.count < 2
  end

  def permitted_attributes
    [:strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :name]
  end

end

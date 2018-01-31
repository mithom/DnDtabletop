class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  # Be aware, scoping is also verified.
  # This can be skipped with 'skip_authorization' if there is nothing to
  # authorize. In that case, you might consider not placing it here.
  after_action :verify_authorized

  def protected_index
    p current_user
    #     if user_signed_in?
    #       test_class = CharacterClass.create!(name: 'test_class')
    #       multi_class = CharacterClass.create!(name: 'multi_class')
    #       char = Character.create!(name: 'tester', strength: 1, dexterity: 2, constitution: 3,
    #                                intelligence: 4, wisdom: 5, charisma: 6,
    #                                lvl: [{lvl: 6, class: test_class.id}, {lvl: 4, class: multi_class.id}],
    #                                user: current_user)
    #       p char.character_lvl
    #     end
  end
end

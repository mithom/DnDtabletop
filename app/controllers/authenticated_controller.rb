class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  # This can be skipped with 'skip_authorization' if there is nothing to
  # authorize. In that case, you might consider not placing it here.
  after_action :verify_authorized
  # This can be skipped with 'skip_policy_scope' if there is nothing to scope on
  after_action :verify_policy_scoped

  def profile
    skip_policy_scope
    skip_authorization
    ## just a function to populate your database during testing
    # if user_signed_in?
    #   test_class = CharacterClass.create!(name: 'test_class')
    #   multi_class = CharacterClass.create!(name: 'multi_class')
    #   test_race = Race.create!(name: 'lol_race')
    #   char = Character.create!(name: 'tester', strength: 1, dexterity: 2, constitution: 3,
    #                            intelligence: 4, wisdom: 5, charisma: 6,
    #                            user: current_user, race: test_race)
    #   test = ClassLvl.create!(lvl: 2, character: char, character_class_id: test_class.id)
    #   testing = ClassLvl.create!(lvl: 9, character: char, character_class_id: multi_class.id)
    # end
    # race_feat = RacialFeat.create!(name: 'str bonus', race: current_user.characters.first.race,
    #                    description: 'this test race gains 2 bonus str at lvl 2', minimum_lvl: 2)
    # Effect.create!(effect_node: 'strength', effect_function: '[0, self.class.modifier(intelligence)].max',
    #                effectable: race_feat)

  end
end

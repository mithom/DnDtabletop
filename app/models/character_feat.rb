class CharacterFeat
  include Mongoid::Document
  include Feat

  field :minimum_lvl, type: Integer

  scope :lvl_req, ->(character) { where(:minimum_lvl.lte => character.character_lvl) }
end

class CharacterFeat
  include Mongoid::Document
  include Feat

  scope :lvl_req, ->(character) { where(:minimum_lvl.lte => character.character_lvl) }
end

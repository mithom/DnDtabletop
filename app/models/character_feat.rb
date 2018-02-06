class CharacterFeat
  include Mongoid::Document
  include Feat

  scope :lvl_req, ->(user) { where(:minimum_lvl.lte, user.character_lvl) }
end

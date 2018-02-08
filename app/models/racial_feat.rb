class RacialFeat
  include Mongoid::Document
  include Feat

  scope :lvl_req, ->(character) { where(:minimum_lvl.lte => character.character_lvl) }

  embedded_in :race
end

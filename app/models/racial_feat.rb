class RacialFeat
  include Mongoid::Document
  include Feat

  scope :lvl_req, ->(user) { where(:minimum_lvl.lte, user.character_lvl) if user.race == parent }

  embedded_in :race
end

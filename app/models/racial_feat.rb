class RacialFeat
  include Mongoid::Document
  include Feat

  embedded_in :race
end

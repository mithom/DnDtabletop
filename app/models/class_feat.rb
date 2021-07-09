class ClassFeat
  include Mongoid::Document
  include Feat

  field :minimum_lvl, type: Integer

  scope :lvl_req, ->(class_lvl) { where(:minimum_lvl.lte, class_lvl.lvl) if class_lvl.character_class == '' }

  embedded_in :character_class
end

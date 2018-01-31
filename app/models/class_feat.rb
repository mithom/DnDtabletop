class ClassFeat
  include Mongoid::Document
  include Feat

  embedded_in :character_class
end

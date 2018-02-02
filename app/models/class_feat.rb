class ClassFeat
  include Mongoid::Document
  include Feat

  field :name, type: String

  embedded_in :character_class
end

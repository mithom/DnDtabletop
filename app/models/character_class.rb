class CharacterClass
  include Mongoid::Document

  field :name, type: String

  embeds_many :class_feats
end

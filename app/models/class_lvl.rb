class ClassLvl
  include Mongoid::Document

  field :lvl, type: Integer
  field :first_class, type: Boolean

  embedded_in :character

  belongs_to :character_class, inverse_of: nil, index: true
end

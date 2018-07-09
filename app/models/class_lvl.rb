class ClassLvl
  include Mongoid::Document

  field :lvl, type: Integer, default: 1
  field :first_class, type: Boolean, default: false

  embedded_in :character

  belongs_to :character_class, inverse_of: nil, index: true
end

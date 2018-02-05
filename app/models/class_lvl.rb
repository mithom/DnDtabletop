class ClassLvl
  include Mongoid::Document
  #validate :max_count_one

  field :lvl, type: Integer

  embedded_in :character

  belongs_to :character_class, inverse_of: :lo

end
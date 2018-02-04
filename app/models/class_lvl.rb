class ClassLvl
  include Mongoid::Document
  #validate :max_count_one

  field :lvl, type: Integer

  embedded_in :character

  # Manual belongs_to :character_class association
  field :character_class_id, type: BSON::ObjectId

  attr_readonly :character_class_id

  def character_class
    # these classes will be big, so we don't want to load them them in if not necessary
    # this scoping method allows for usage of 'pluck'
    CharacterClass.where(id: character_class_id)
  end

end
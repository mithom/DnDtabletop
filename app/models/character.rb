class Character
  include Mongoid::Document
  include Mongoid::Timestamps # We can track usage over time
  # TODO: add validation for classes matching classes in lvl
  # TODO: add validation for lvl format

  field :name, type: String

  # base stats (after the rolls, nothing else included)
  field :strength, type: Integer
  field :dexterity, type: Integer
  field :constitution, type: Integer
  field :intelligence, type: Integer
  field :wisdom, type: Integer
  field :charisma, type: Integer

  field :lvl, type: Array, default: [] # Array of hashes with keys: :lvl & :class

  def character_lvl # read_only attr
    char_lvl = 0
    lvl.each do |class_lvl|
      char_lvl += class_lvl[:lvl]
    end
    char_lvl
  end

  has_and_belongs_to_many :character_class, inverse_of: nil
  embedded_in :user
  has_and_belongs_to_many :character_feats, inverse_of: nil
end

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

  # read_only attr
  def character_lvl
    class_lvls.sum(:lvl)
  end

  embedded_in :user
  has_and_belongs_to_many :character_feats, inverse_of: nil
  embeds_many :class_lvls
end

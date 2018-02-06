class Character
  include Mongoid::Document
  include Mongoid::Timestamps # We can track usage over time
  include Mongoid::Attributes::Dynamic # This will store which path is chosen for the class and race.
  include Effects

  field :name, type: String

  # base stats (after the rolls, nothing else included)
  field :strength, type: Integer
  field :dexterity, type: Integer
  field :constitution, type: Integer
  field :intelligence, type: Integer
  field :wisdom, type: Integer
  field :charisma, type: Integer

  add_effects :strength
  add_effects :dexterity
  add_effects :constitution
  add_effects :intelligence
  add_effects :wisdom
  add_effects :charisma

  # read_only attr
  def character_lvl
    class_lvls.sum(:lvl)
  end

  def self.modifier(stat)
    ((stat-10)/2).floor
  end

  embedded_in :user
  has_and_belongs_to_many :character_feats, inverse_of: nil, index: true
  embeds_many :class_lvls
  belongs_to :race, inverse_of: nil, index: true
end

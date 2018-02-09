class Character
  include Mongoid::Document
  include Mongoid::Timestamps # We can track usage over time
  include Mongoid::Attributes::Dynamic # This will store which path is chosen for the class and race.
  include EffectNodes

  field :name, type: String

  # base stats (after the rolls, nothing else included)
  field :strength, type: Integer
  field :dexterity, type: Integer
  field :constitution, type: Integer
  field :intelligence, type: Integer
  field :wisdom, type: Integer
  field :charisma, type: Integer

  add_effect_node :strength
  add_effect_node :dexterity
  add_effect_node :constitution
  add_effect_node :intelligence
  add_effect_node :wisdom
  add_effect_node :charisma

  # read_only attr
  def character_lvl
    class_lvls.sum(:lvl)
  end

  def self.modifier(stat)
    ((stat-10)/2).floor
  end

  def encumberred?
    inventory.carry_weight > 15 * strength
  end

  def attack_bonus
    strength # TODO: make dependable on weapon, finesse -> allow dex
  end
  add_effect_node :attack_bonus

  def speed
    race.speed - inventory.item_amounts.armors.select{|armor| armor.equipped? }.first.try(:speed_penalty, self).to_i
  end
  add_effect_node :speed

  embedded_in :user
  has_and_belongs_to_many :character_feats, inverse_of: nil, index: true
  embeds_many :class_lvls
  belongs_to :race, inverse_of: nil, index: true
  embeds_one :inventory
end

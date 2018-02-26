class Character
  include Mongoid::Document
  include Mongoid::Timestamps # We can track usage over time
  include Mongoid::Attributes::Dynamic # This will store which path is chosen for the class and race.
  include EffectNodes
  include Constants

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

  add_effect_node :weapon_proficiencies, type: :list, old: false
  add_effect_node :armor_proficiencies, type: :list, old: false
  add_effect_node :tool_proficiencies, type: :list, old: false

  def has_proficiency?(item)
    return false unless item
    case item.class
    when Items::Armor
      armor_proficiencies.include? item.armor_type.to_sym
    when Items::Weapon
      weapon_proficiencies.include? item.weapon_type.to_sym
    when Items::Tool
      tool_proficiencies.include? item.tool_type.to_sym
    else
      false
    end
  end

  def self.modifier(stat)
    ((stat - 10) / 2).floor
  end

  # read_only attr
  def character_lvl
    class_lvls.sum(:lvl)
  end

  def encumberred?
    inventory.carry_weight > 15 * strength
  end

  def attack_bonus
    attack_bonus = self.class.modifier(strength) # TODO: make dependable on weapon, finesse -> allow dex
    attack_bonus += proficiency_bonus if has_proficiency?(Inventory.equipped(inventory.weapons).first.item)
    attack_bonus
  end
  add_effect_node :attack_bonus

  def equipped_armor
    Inventory.equipped(inventory.armors).first
  end
  def speed
    @speed ||= race.speed - equipped_armor.try(:item).try(:speed_penalty, self).to_i
  end
  add_effect_node :speed

  def proficiency_bonus
    PROFICIENCY_BONUS[character_lvl]
  end

  def ac
    if equipped_armor
      equipped_armor.item.calculated_ac(self)
    else
      10 + dexterity
    end
  end
  add_effect_node :ac

  def character_class_lvls
    RequestStore.store[:"class_lvls.#{id}"] ||= class_lvls.includes(:character_class)
  end

  embedded_in :user
  has_and_belongs_to_many :character_feats, inverse_of: nil, index: true
  embeds_many :class_lvls
  belongs_to :race, inverse_of: nil, index: true
  embeds_one :inventory

  accepts_nested_attributes_for :class_lvls, :inventory

  rails_admin do
    configure :character_feats do
      pretty_value do
        bindings[:object].send(:character_feats).map { |v| "#{v.name}: " + v.effects.collect(&:name).join(', ') }.join(' <br />').html_safe
      end
    end

    # TODO: find solution for this
    edit do
      exclude_fields :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
    end
  end
end

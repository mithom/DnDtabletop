module Items
  class Weapon < Item
    include Mongoid::Enum
    include Constants::DamageTypes
    include Constants::WeaponTypes

    field :equippable, type: Boolean, default: true, overwrite: true
    field :damage_dice, type: Integer
    field :dice_amount, type: Integer
    enum :weapon_type, WEAPON_TYPES, default: ''
    enum :damage_type, DAMAGE_TYPES, default: '' # weapons can also deal magical damage
  end
end

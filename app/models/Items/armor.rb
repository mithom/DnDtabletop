module Items
  class Armor < Item
    include Mongoid::Enum
    include Constants::ArmorTypes

    field :equippable, type: Boolean, default: true, overwrite: true
    field :ac, type: Integer
    # :max_dex only has importance when :type is :medium
    field :max_dex, type: Integer
    field :strength, type: Integer, default: 0
    field :stealth_disadvantage, type: Boolean

    enum :armor_type, ARMOR_TYPES, default: ''

    def speed_penalty(character)
      heavy? && character.strength < strength ? 10 : 0
    end
  end
end

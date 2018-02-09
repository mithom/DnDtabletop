module Items
  class Armor < Item
    include Mongoid::Enum

    field :equipable, type: Boolean, default: true, overwrite: true
    field :equipped, type: Boolean, default: false
    field :ac, type: Integer
    # :max_dex only has importance when :type is :medium
    field :max_dex, type: Integer
    field :strength, type: Integer, default: 0
    field :stealth_disadvantage, type: Boolean

    enum :armor_type, [:heavy, :medium, :light], default: ""

    def speed_penalty(character)
      armor_type.heavy? && character.strength < strength ? 10 : 0
    end
  end
end
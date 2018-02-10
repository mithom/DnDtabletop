module Items
  class Weapon < Item

    field :equippable, type: Boolean, default: true, overwrite: true

  end
end
class Weapon < Item

  field :equippable, type: Boolean, default: true, overwrite: true
  field :equipped, type: Boolean

end
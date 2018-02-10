class Item
  include Mongoid::Document

  field :name, type: String
  field :weight, type: Integer
  field :equippable, type: Boolean, default: false
  # This value will represent the cost of something, all price calculations find place on this value
  field :value, type: Integer
  field :description, type: String
end

class Item
  include Mongoid::Document

  field :name, type: String
  field :weight, type: Integer
  field :equippable, type: Boolean, default: false
  # This value will represent the cost of something, all price calculations find place on this value
  field :value, type: Integer
  field :description, type: String

  has_and_belongs_to_many :item_properties, inverse_of: nil

  rails_admin do
    configure :item_properties do
      pretty_value do
        bindings[:object].send(:character_feats).map { |v| "#{v.name}: " + v.effects.collect(&:name).join(', ') }.join(' <br />').html_safe
      end
    end
  end
end

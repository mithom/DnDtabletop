class ItemAmount
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  validates_presence_of :item

  field :amount, type: Integer

  def weight
    amount * item.weight
  end

  def equippable?
    item.equippable?
  end

  embedded_in :inventory
  belongs_to :item, index: true, inverse_of: nil
end

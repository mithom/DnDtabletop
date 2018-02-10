class ItemAmount
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  validates_presence_of :item
  validates_presence_of :equipped, if: :equippable?

  field :amount, type: Integer

  def weight
    amount * item.weight
  end

  def equippable?
    self.item.equippable?
  end

  embedded_in :inventory
  belongs_to :item, index: true, inverse_of: nil
end

class ItemAmount
  include Mongoid::Document

  field :amount, type: Integer

  def weight
    amount * item.weight
  end

  embedded_in :inventory
  belongs_to :item, index: true
end

class ItemAmount
  include Mongoid::Document

  field :amount, type: Integer

  def weight
    amount * item.weight
  end

  belongs_to :item, index: true
end

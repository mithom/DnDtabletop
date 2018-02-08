class Inventory
  include Mongoid::Document

  def carry_weight
    # TODO: implement
  end

  field :platinum, type: Integer
  field :gold, type: Integer
  field :electrum, type: Integer
  field :silver, type: Integer
  field :copper, type: Integer

  embeds_many :item_amounts

  embedded_in :character
end

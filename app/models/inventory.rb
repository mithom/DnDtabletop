class Inventory
  include Mongoid::Document

  def carry_weight
    item_amounts.collect(&:weight).sum
  end

  field :platinum, type: Integer, default: 0
  field :gold, type: Integer, default: 0
  field :electrum, type: Integer, default: 0
  field :silver, type: Integer, default: 0
  field :copper, type: Integer, default: 0

  embeds_many :item_amounts do
    def armors
      where('item._type': 'Armor')
    end

    def weapons
      where('item._type': 'Weapon')
    end

    def tools
      where('item._type': 'Tool')
    end
  end

  embedded_in :character
end

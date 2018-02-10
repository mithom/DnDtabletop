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
      @target.select { |item_amount| item_amount.item._type == 'Items::Armor' }
    end

    def equipped
      @target.select{|armor| armor.item.equipped? }
    end
  end
  embedded_in :character

  accepts_nested_attributes_for :item_amounts
end

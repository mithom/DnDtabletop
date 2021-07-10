class Inventory
  include Mongoid::Document
  attr_reader :carry_weight

  field :platinum, type: Integer, default: 0
  field :gold, type: Integer, default: 0
  field :electrum, type: Integer, default: 0
  field :silver, type: Integer, default: 0
  field :copper, type: Integer, default: 0

  embeds_many :item_amounts

  def carry_weight
    @carry_weight ||= items.collect(&:weight).sum
  end

  def armors
    items.select { |item_amount| item_amount.item._type == 'Items::Armor' }
  end

  def weapons
    items.select { |item_amount| item_amount.item._type == 'Items::Weapon' }
  end

  def self.equipped(items)
    items.select { |item_amount| item_amount.try(:equipped) }
  end

  private

  def items
    RequestStore.store[:"items.#{id}"] ||= item_amounts.includes(:item).to_a
  end
  embedded_in :character

  accepts_nested_attributes_for :item_amounts
end

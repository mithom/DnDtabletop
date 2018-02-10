class Race
  include Mongoid::Document

  field :name, type: String
  field :speed, type: Integer

  embeds_many :racial_feats
  accepts_nested_attributes_for :racial_feats

  index "racial_feats.minimum_lvl" => 1
  index "racial_feats.effects.effect_node" => 'text'
end

class Race
  include Mongoid::Document

  field :name, type: String

  embeds_many :racial_feats

  index "racial_feats.minimum_lvl" => 1
  index "racial_feats.effects.effect_node" => 'text'
end

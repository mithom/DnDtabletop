class Race
  include Mongoid::Document

  field :name, type: String

  embeds_many :racial_feats
end

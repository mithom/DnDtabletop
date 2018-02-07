require 'active_support/concern'

module Feat
  extend ActiveSupport::Concern

  included do
    field :name, type: String
    field :description, type: String
    field :minimum_lvl, type: Integer

    embeds_many :effects, as: :effectable

    # Indexes make queries go fast for (little) slower insertions
    # this is pretty static data, so <3 indexes
    index effect_node: 1
    index minimum_lvl: 1
  end
end

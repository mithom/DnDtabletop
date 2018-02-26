require 'active_support/concern'

module Feat
  extend ActiveSupport::Concern

  included do
    field :name, type: String
    field :description, type: String

    embeds_many :effects, as: :effectable
    accepts_nested_attributes_for :effects

    # Indexes make queries go fast for (little) slower insertions
    # this is pretty static data, so <3 indexes
    index minimum_lvl: 1
  end
end

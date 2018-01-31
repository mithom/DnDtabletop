require 'active_support/concern'

module Feat
  extend ActiveSupport::Concern

  included do
    field :description, type: String
  end
end

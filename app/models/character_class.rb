class CharacterClass
  include Mongoid::Document
  # Needed because classes ending on s will get interpreted as plural otherwise
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.singular('character_class', 'character_class')
  end

  field :name, type: String

  embeds_many :class_feats
end

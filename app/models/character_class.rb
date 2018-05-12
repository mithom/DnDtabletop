class CharacterClass
  include Mongoid::Document
  # Needed because classes ending on s will get interpreted as plural otherwise
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.singular('character_classes', 'character_class')
  end

  field :name, type: String
  field :hit_dice, type:  Integer

  embeds_many :class_feats
  accepts_nested_attributes_for :class_feats

  rails_admin do
    configure :class_feats do
      pretty_value do
        bindings[:object].send(:racial_feats).map { |v| "#{v.name}: " + v.effects.collect(&:name).join(', ') }.join(' <br />').html_safe
      end
    end
  end
end

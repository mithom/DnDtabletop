require 'active_support/concern'
module Effects
  extend ActiveSupport::Concern

  included do
    def self.add_effects(field)
      send :define_method, "#{field}_node" do
        field_name = "#{field}"
        eval("@#{field_name}_node ||= EffectNode.new(field_name,self)")
      end

      send :define_method, "#{field}" do
        super() + eval("#{field}_node").result
      end
    end
  end

end
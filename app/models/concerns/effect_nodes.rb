require 'active_support/concern'
module EffectNodes
  extend ActiveSupport::Concern

  class_methods do
    def add_effect_node(field)
      define_method "#{field}_node" do
        field_name = "#{field}"
        eval("@#{field_name}_node ||= EffectNode.new(field_name,self)")
      end

      old = instance_method(field)

      define_method "#{field}" do
        old.bind(self).() + eval("#{field}_node").result
      end

    end
  end

end
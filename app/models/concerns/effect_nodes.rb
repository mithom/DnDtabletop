require 'active_support/concern'
module EffectNodes
  extend ActiveSupport::Concern

  class_methods do
    def add_effect_node(field, type: :int, old: true)
      define_method "#{field}_node" do
        field_name = field.to_s
        case type
        when :int
          eval("@#{field_name}_node ||= EffectNode.new(field_name, self)")
        when :list
          eval("@#{field_name}_node ||= EffectList.new(field_name, self)")
        else
          throw "unsupported effect type: #{type}"
        end
      end

      old_fun = instance_method(field) if old

      define_method field.to_s do
        case type
        when :int
          if old
            old_fun.bind(self).call + eval("#{field}_node").result
          else
            eval("#{field}_node").result
          end

        when :list
          if old
            old_fun.bind(self).call << eval("#{field}_node").result
          else
            eval("#{field}_node").result
          end

        else
          throw "unsupported effect type: #{type}"
        end
      end
    end
  end
end

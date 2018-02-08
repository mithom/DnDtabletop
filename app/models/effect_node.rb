class EffectNode
  attr_reader :name

  def initialize(name, character)
    @name      = name.to_s
    @character = character
    @effects   = []
    find_effects
  end

  def result_
    result = 0
    @effects.each do |effect|
      result += @character.instance_eval(effect.effect_function)
    end
    result
  end

  def result
    @result ||= result_
  end

  private

  # TODO: optimise so that feats or only querried once for the same character
  def find_effects
    @character.character_feats.lvl_req(@character).each do |feat|
      feat.effects.where(effect_node: name).each do |effect|
        @effects << effect
      end
    end
    @character.race.racial_feats.lvl_req(@character).each do |feat|
      feat.effects.where(effect_node: name).each do |effect|
        @effects << effect
      end
    end
    @character.class_lvls.each do |class_lvl|
      class_lvl.character_class.class_feats.lvl_req(class_lvl).each do |feat|
        feat.effects.where(effect_node: name).each do |effect|
          @effects << effect
        end
      end
    end
  end
end

class EffectNode
  attr_reader :name

  def initialize(name, character)
    @name      = name.to_s
    @character = character
    @effects   = []
    find_effects
  end

  def result
    result = 0
    @effects.each do |feat|
      result += @character.instance_eval(feat.effect_function)
    end
    result
  end

  private

  def find_effects
    @character.character_feats.where(effect_node: name).each do |feat|
      @effects << feat
    end
    @character.race.racial_feats.lvl_req(@character).where(effect_node: name).each do |feat|
      @effects << feat
    end
    @character.class_lvls.each do |class_lvl|
      class_lvl.character_class.class_feats.lvl_req(class_lvl).where(effect_node: name).each do |feat|
        @effects << feat
      end
    end
  end
end

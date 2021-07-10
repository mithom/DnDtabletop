class EffectList < EffectNode
  def result_
    find_effects
    result = []
    @effects.each do |effect|
      result.concat @character.instance_eval(effect.effect_function)
    end
    result
  end
end

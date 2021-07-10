class EffectNode
  attr_reader :name

  def initialize(name, character)
    @name      = name.to_s
    @character = character
    @effects   = []
  end

  def result_
    find_effects
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

  def find_effects
    # RequestStore prevents multiple database calls for the same feats here (in case of multiple effect_nodes)
    RequestStore.store[:"character_feats.#{@character.id}"] ||= @character.character_feats.lvl_req(@character).to_a
    RequestStore.store[:"character_feats.#{@character.id}"].each do |feat|
      feat.effects.where(effect_node: name).each do |effect|
        @effects << effect
      end
    end

    RequestStore.store[:"racial_feats.#{@character.id}"] ||= @character.race.racial_feats.lvl_req(@character).to_a
    RequestStore.store[:"racial_feats.#{@character.id}"].each do |feat|
      feat.effects.where(effect_node: name).each do |effect|
        @effects << effect
      end
    end

    unless RequestStore.store[:"class_feats.#{@character.id}"].present?
      RequestStore.store[:"class_feats.#{@character.id}"] = []
      @character.class_lvls.each do |class_lvl|
        RequestStore.store[:"class_feats.#{@character.id}"] += class_lvl.character_class.class_feats.lvl_req(class_lvl)
      end
    end
    RequestStore.store[:"class_feats.#{@character.id}"].each do |feat|
      feat.effects.where(effect_node: name).each do |effect|
        @effects << effect
      end
    end

    Inventory.equipped(@character.inventory.items).each do |item|
      # TODO: optimize with database filter
      item.item.item_properties.select { |item_prop| item_prop.effect_node == name }.each do |effect|
        @effects << effect
      end
    end
  end
end

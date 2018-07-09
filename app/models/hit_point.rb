class HitPoint
  include Mongoid::Document
  include EffectNodes

  field :rolled_hp, type: Integer, default: 0
  field :use_default_hp, type: Boolean, default: true
  field :current_hp, type: Integer, default: 0
  field :temp_max_hp, type: Integer, default: 0
  field :death_saving_success, type: Integer, default: 0
  field :death_saving_failure, type: Integer, default: 0
  field :death, type: Boolean, default: false
  field :stable, type: Boolean, default: true

  def max_hp
    if use_default_hp
      temp_max_hp + get_classes_hp
    else
      rolled_hp + temp_max_hp
    end
  end

  def get_classes_hp
    character.class_lvls.sum { |class_lvl|
      if class_lvl.first_class
        p 'hallo'
        p class_lvl.character_class.hit_dice
        p ((class_lvl.character_class.hit_dice/2).floor +1) * (class_lvl.lvl-1)
        p (((class_lvl.character_class.hit_dice/2).floor +1) * (class_lvl.lvl-1) + class_lvl.character_class.hit_dice)
        (((class_lvl.character_class.hit_dice/2).floor +1) * (class_lvl.lvl-1) + class_lvl.character_class.hit_dice)
      else
        p ((class_lvl.character_class.hit_dice/2).floor +1) * class_lvl.lvl
        ((class_lvl.character_class.hit_dice/2).floor +1) * class_lvl.lvl
      end
    }.to_i
  end

  def add_current_hp!(healing_value)
    current_hp = [current_hp + healing_value, max_hp]
  end

  def take_damage!(damage_value)
    stable = false
    if current_hp == 0
      if damage_value > max_hp
        death = true
      else
        fail_death_saving_throw!
      end
    else
      if current_hp > damage_value
        current_hp -= damage_value
      else
        damage_value -= current_hp
        current_hp = 0
        death = true unless damage_value < max_hp
      end
    end
  end

  def fail_death_saving_throw!
    death_saving_failure += 1
    death = true if death_saving_failure == 3
  end

  def success_death_saving_throw!
    death_saving_success += 1
    stabilize! if death_saving_success == 3
  end

  def stabilize!
    death_saving_failure = 0
    death_saving_success = 0
    stable = true
  end

  embedded_in :character

end
